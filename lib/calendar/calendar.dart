import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:personal_study/common/customeDrawer.dart';
import 'package:personal_study/common/header.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  final String title = 'カレンダー';
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, List> _eventsList = {};

  // イベントデータのLinkedHashMap同一値比較用
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  // イベントのデモデータ
  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _eventsList = {
      DateTime.now().subtract(Duration(days: 2)): ['Test A', 'Test B'],
      DateTime.now(): ['Test C', 'Test D', 'Test E', 'Test F'],
    };
  }

  @override
  Widget build(BuildContext context) {
    // MapからLinkedHashMap変換（推奨）
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    // イベント一覧を返す
    List getEvent(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
      appBar: Header(
        title: this.title,
      ),
      body: Column(children: [
        TableCalendar(
          // 必須オプション
          firstDay: DateTime.utc(2022, 4, 1),
          lastDay: DateTime.utc(2025, 12, 31),
          focusedDay: _focusedDay,
          locale: 'ja_JP',
          eventLoader: getEvent,
          // shouldFillViewport: true,
          // 土日の色を変更するカスタムビルダー
          calendarBuilders: CalendarBuilders(dowBuilder: (_, day) {
            final text = DateFormat.E('ja_JP').format(day);
            Color? weekendColor = null;
            if (day.weekday == DateTime.sunday) {
              weekendColor = Colors.red;
            } else if (day.weekday == DateTime.saturday) {
              weekendColor = Colors.blue;
            } else {
              weekendColor = Colors.black;
            }
            return Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 12, color: weekendColor),
              ),
            );
          }),
          // タップ選択した日付をフォーカス
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        ListView(
          shrinkWrap: true,
          // reverse: true,
          children: getEvent(_selectedDay!)
              .map(
                (event) => Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      event.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ]),
      drawer: CustomeDrawer(),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:personal_study/common/customeThemeColor.dart';
import 'package:personal_study/calendar/calendar.dart';

// class customeDrawer extends StatelessWidget {
class CustomeDrawer extends StatefulWidget {
  @override
  State<CustomeDrawer> createState() => _CustomeDrawer();
}

class _CustomeDrawer extends State<CustomeDrawer> {
  static const int ITEM_INDEX_HOME = 0;
  static const int ITEM_INDEX_ACTIVITY = 1;
  static const int ITEM_INDEX_CALENDAR = 2;
  static const int ITEM_INDEX_PICTURE = 3;
  static const int ITEM_INDEX_MAP = 4;

  int _selectedIndex = ITEM_INDEX_HOME;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 80,
            child: DrawerHeader(
              decoration:
                  BoxDecoration(color: CustomeThemeColor.customeColorSwatch),
              child: Text(
                '行動記録アプリ',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
              title: Text('ホーム'),
              leading: Icon(Icons.home),
              selected: _selectedIndex == ITEM_INDEX_HOME,
              onTap: () {
                _onItemTapped(ITEM_INDEX_HOME);
                Navigator.pop(context);
              }),
          ListTile(
              title: Text('行動記録'),
              leading: Icon(Icons.work),
              selected: _selectedIndex == ITEM_INDEX_ACTIVITY,
              onTap: () {
                _onItemTapped(ITEM_INDEX_ACTIVITY);
                Navigator.pop(context);
              }),
          ListTile(
              title: Text('カレンダー'),
              leading: Icon(Icons.calendar_month),
              selected: _selectedIndex == ITEM_INDEX_CALENDAR,
              onTap: () {
                _onItemTapped(ITEM_INDEX_CALENDAR);
                // Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Calendar(),
                  ),
                );
              }),
          ListTile(
              title: Text('ピクチャ'),
              leading: Icon(Icons.picture_in_picture),
              selected: _selectedIndex == ITEM_INDEX_PICTURE,
              onTap: () {
                _onItemTapped(ITEM_INDEX_PICTURE);
                Navigator.pop(context);
              }),
          ListTile(
              title: Text('地図'),
              leading: Icon(Icons.map),
              selected: _selectedIndex == ITEM_INDEX_MAP,
              onTap: () {
                _onItemTapped(ITEM_INDEX_MAP);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}

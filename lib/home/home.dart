import 'package:flutter/material.dart';

import 'package:personal_study/calendar/calendar.dart';
import 'package:personal_study/common/customeDrawer.dart';
import 'package:personal_study/common/header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ホーム'),
      //   centerTitle: true,
      // ),
      appBar: Header(
        title: 'ホーム',
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Calendar(),
                      ))
                },
                child: Text('カレンダーへ'),
              )
            ],
          ),
        ),
      ),
      drawer: CustomeDrawer(),
    );
  }
}

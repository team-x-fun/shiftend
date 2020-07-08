import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shiftend/debug_views/debug_page.dart';
import 'package:shiftend/sample_page.dart';
import 'package:shiftend/member_page.dart';
import 'package:shiftend/pages/calendar/calendar_page.dart';

void main() {
  initializeDateFormatting().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shiftend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    CalendarPage(),
    MemberPage(),
    SamplePage(),
    DebugPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text('カレンダー')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('メンバー')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('設定')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('debug')),
        ],
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

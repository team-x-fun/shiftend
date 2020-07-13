import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/debug_views/debug_page.dart';
import 'package:shiftend/pages/calendar/calendar_state_controller.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/calendar_page.dart';
import 'package:shiftend/pages/setting/setting_page.dart';
import 'package:shiftend/pages/member/member_page.dart';

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
    SettingPage(),
    DebugPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<CalendarStateController, CalendarState>(
          create: (_) => CalendarStateController(),
        )
      ],
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: const Text('カレンダー')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: const Text('メンバー')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: const Text('設定')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: const Text('debug')),
          ],
        ),
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

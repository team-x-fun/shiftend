import 'package:flutter/material.dart';
import 'package:shiftend/sample_page.dart';
import 'package:shiftend/member_page.dart';
import 'package:shiftend/setting/setting_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  final List<Widget> _pages = [SamplePage(), MemberPage(), SettingPage()];
  final List<String> _titles = ['カレンダー', 'メンバー', '設定'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
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

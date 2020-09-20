import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/debug_views/debug_page.dart';
import 'package:shiftend/pages/calendar/calendar_page.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/calendar_state_controller.dart';
import 'package:shiftend/pages/login/login_page.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/login/login_state_controller.dart';
import 'package:shiftend/pages/setting/setting_page.dart';
import 'package:shiftend/pages/member/member_page.dart';
import 'package:shiftend/repositories/mocks/shift_repository_mock.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';
import 'package:shiftend/repositories/shift_repository.dart';
import 'package:shiftend/repositories/user_repository.dart';

void main() {
  initializeDateFormatting().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ShiftRepository>.value(
          value: ShiftRepository(
              firestore: Firestore.instance,
              userRepo: UserRepository(
                  firestore: Firestore.instance, auth: FirebaseAuth.instance)),
        ),
        Provider<ShiftRepositoryMock>.value(
          value: ShiftRepositoryMock(userRepo: UserRepositoryMock()),
        ),
        Provider<UserRepository>.value(
          value: UserRepository(
              firestore: Firestore.instance, auth: FirebaseAuth.instance),
        ),
        StateNotifierProvider<LoginStateController, LoginState>(
          create: (context) => LoginStateController(),
        ),
      ],
      child: MaterialApp(
        title: 'Shiftend',
        theme: ThemeData(
          primaryColor: Colors.grey[100],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Main(),
      ),
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
    LoginPage(),
    DebugPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isLogin = Provider.of<LoginState>(context, listen: true).isLogin;
    final bottomNavItems = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today), title: Text('カレンダー')),
      const BottomNavigationBarItem(
          icon: Icon(Icons.person), title: Text('メンバー')),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), title: Text('設定')),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), title: Text('ログインページ')),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), title: Text('debug')),
    ];
    if (!isLogin) {
      // TODO: ログインしていないときは，ログインページに飛ばす
      // return LoginPage();
    }
    return MultiProvider(
      providers: [
        StateNotifierProvider<CalendarStateController, CalendarState>(
          create: (context) => CalendarStateController(),
        ),
      ],
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          items: bottomNavItems,
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

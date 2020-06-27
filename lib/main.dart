import 'package:flutter/material.dart';
import 'package:shiftend/sample_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  final List<Widget> _children = [
    SamplePage('Home'),
    SamplePage('Search'),
    SamplePage('Favorite'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shiftend'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(''),
          )
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

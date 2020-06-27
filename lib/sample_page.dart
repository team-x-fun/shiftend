import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  final String title;

  SamplePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(title + 'だよ'),
    );
  }
}

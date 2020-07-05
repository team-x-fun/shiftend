import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingHeaderItem extends StatelessWidget {
  final String headerTitle;
  SettingHeaderItem(this.headerTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: ListTile(
        dense: true,
        title: Text(
          headerTitle,
          style: TextStyle(
            fontSize: 15,
//            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

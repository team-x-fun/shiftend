import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingHeaderItem extends StatelessWidget {
  const SettingHeaderItem(this.headerTitle);

  final String headerTitle;

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
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

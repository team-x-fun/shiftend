import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingListItem extends StatelessWidget {
  const SettingListItem(this.detailTitle);

  final String detailTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => print('SettingListItemを押した'),
        title: Text(detailTitle),
      ),
    );
  }
}

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
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () => print('「$detailTitle」を押しました。'),
        title: Text(detailTitle),
      ),
    );
  }
}

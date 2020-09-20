import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/util/typedefs.dart';

class SettingListItem extends StatelessWidget {
  const SettingListItem({this.detailTitle, this.onTapItem});

  final String detailTitle;
  final VoidFunction onTapItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: onTapItem,
        title: Text(detailTitle),
      ),
    );
  }
}

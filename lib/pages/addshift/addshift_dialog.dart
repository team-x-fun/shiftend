import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

class AddShiftDialog extends StatelessWidget {
  const AddShiftDialog({this.member});
  final Member member;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('シフトの追加'),
      content: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text(member.user.name),
              subtitle: Text(member.role),
            ),
          ),
        ],
      ),
    );
  }
}

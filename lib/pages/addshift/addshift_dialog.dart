import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

class AddShiftDialog extends StatelessWidget {
  const AddShiftDialog({this.requestedShift});
  final Shift requestedShift;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('シフトの追加'),
      content: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text(requestedShift.member.user.name),
              subtitle: Text(requestedShift.member.role),
            ),
          ),
        ],
      ),
    );
  }
}

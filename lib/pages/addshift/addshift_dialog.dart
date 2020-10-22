import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/util/formatters.dart';

class AddShiftDialog extends StatelessWidget {
  const AddShiftDialog({this.requestedShift});
  final Shift requestedShift;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('シフトの追加'),
      content: Column(
        children: <Widget>[
          ListTile(
            title: Text(requestedShift.member.user.name),
            subtitle: Text(requestedShift.member.role),
          ),
          Text(fullDateToJa(requestedShift.start)),
          Text(fullDateToJa(requestedShift.end)),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

class ShiftItem extends StatelessWidget {
  const ShiftItem({this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const RoundedRectangleBorder(),
          color: Colors.grey[50],
          padding: const EdgeInsets.all(0),
          onPressed: () => {
            Navigator.of(context).pop(),
          },
          child: Container(
            child: ListTile(
              dense: true,
              trailing: const Text(
                '削除する',
                style: TextStyle(color: Colors.green),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(shift.member.user.iconUrl),
                  ),
                ),
              ),
              title: Text(shift.member.user.name),
              subtitle: Text(shift.member.role),
            ),
          ),
        ),
      ],
    );
  }
}

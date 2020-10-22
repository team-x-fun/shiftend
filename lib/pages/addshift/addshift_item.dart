import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/addshift/addshift_dialog.dart';

class AddShiftItem extends StatelessWidget {
  const AddShiftItem({this.requestedShift});

  final Shift requestedShift;

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
            Navigator.push<AddShiftDialog>(
              context,
              MaterialPageRoute(
                builder: (BuildContext _) => AddShiftDialog(
                  requestedShift: requestedShift,
                ),
              ),
            ),
          },
          child: Container(
            child: ListTile(
              dense: true,
              trailing: const Text(
                '追加する',
                style: TextStyle(color: Colors.green),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(requestedShift.member.user.iconUrl),
                  ),
                ),
              ),
              title: Text(requestedShift.member.user.name),
              subtitle: Text(requestedShift.member.role),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_provider.dart';
import 'package:shiftend/util/formatters.dart';

class CalendarAddShiftItem extends StatelessWidget {
  CalendarAddShiftItem({this.user});

  final User user;
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberProvider>(
      create: (_) => MemberProvider(),
      child: Column(
        children: <Widget>[
          Consumer<MemberProvider>(builder: (context, model, child) {
            return FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const RoundedRectangleBorder(),
              color: Colors.grey[50],
              padding: const EdgeInsets.all(0),
              onPressed: () => {
                Navigator.of(context).pop(
                ),
              },
              child: Container(
                child: ListTile(
                  dense: true,
                  trailing: const Text(
                    '追加する',
                    style: TextStyle(
                        color:Colors.green
                    ),
                  ),
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(user.iconUrl),
                      ),
                    ),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.role),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

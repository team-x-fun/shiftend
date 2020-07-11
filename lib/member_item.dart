import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/user/user.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 100,
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         height: 50,
    //         width: 50,
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           image: DecorationImage(
    //             fit: BoxFit.fill,
    //             image: NetworkImage(user.iconUrl),
    //           ),
    //         ),
    //       ),
    //       Container(
    //         width: 10,
    //       ),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(user.name),
    //           Text(user.role),
    //         ],
    //       ),
    //       Text(user.level),
    //     ],
    //   ),
    // );
    return Column(
      children: <Widget>[
        const Divider(
          height: 8.0,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.iconUrl),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                user.name,
              ),
              Text(
                'Lv.' + user.level,
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              )
            ],
          ),
          subtitle: Container(
            //padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              user.role,
              style: TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

import 'models/user/user.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Container(
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
          Container(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.name),
              Text(user.role),
            ],
          ),
          Text(user.level),
        ],
      ),
    );
  }
}

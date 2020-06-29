import 'package:flutter/cupertino.dart';
import 'package:shiftend/member.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(member.iconUrl),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(member.name),
              Text(member.role),
            ],
          ),
          Text(member.level),
        ],
      ),
    );
  }
}

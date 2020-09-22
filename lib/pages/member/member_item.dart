import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'member_detail.dart';
import 'member_provider.dart';
import 'widgets/level_stars_widget.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({
    this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<MemberDetailPage>(
            // builder: (_) => MemberDitailPage(user, memberProvider),
            builder: (_) =>
                MemberDetailPage(user, Provider.of<MemberProvider>(context))));
      },
      dense: true,
      trailing: LevelStars(level: Provider.of<MemberProvider>(context).level),
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
    );
  }
}

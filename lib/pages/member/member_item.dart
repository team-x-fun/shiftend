import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/pages/member/member_state_controller.dart';
import 'member_detail.dart';
import 'widgets/level_stars_widget.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({
    this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    print(Provider.of<MemberState>(context).level);
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<MemberDetailPage>(
            builder: (_) =>
                StateNotifierProvider<MemberStateController, MemberState>.value(
              value: Provider.of<MemberStateController>(context),
              child: MemberDetailPage(user),
            ),
          ),
        );
      },
      dense: true,
      trailing: LevelStars(level: Provider.of<MemberState>(context).level),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/pages/member/member_state_controller.dart';
import 'package:shiftend/util/logger.dart';
import 'member_detail.dart';
import 'widgets/level_stars_widget.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({
    this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final member = context
        .select<MemberState, List<Member>>((state) => state.members)
        .firstWhere((m) => m.user.id == id);
    logger.info('MemberItem build: ${member.user.id}');
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<MemberDetailPage>(
            builder: (_) =>
                StateNotifierProvider<MemberStateController, MemberState>.value(
              value: context.read<MemberStateController>(),
              child: MemberDetailPage(
                id: member.user.id,
              ),
            ),
          ),
        );
      },
      dense: true,
      trailing: LevelStars(
        level: member.level,
      ),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(member.user.iconUrl),
          ),
        ),
      ),
      title: Text(member.user.name),
      subtitle: Text(member.role),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/pages/member/member_state_controller.dart';
import 'package:shiftend/util/logger.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MemberDetailPage extends StatelessWidget {
  const MemberDetailPage({this.id});

  final String id;
  @override
  Widget build(BuildContext context) {
    logger.info('MemberDetailBuild');
    final member = context.select<MemberState, Member>(
        (state) => state.members.firstWhere((m) => m.user.id == id));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'メンバー詳細',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(member.user.iconUrl),
                      )),
                ),
              ),
              Text(
                member.user.name,
                style: const TextStyle(fontSize: 20),
              ),
              ListTile(
                dense: true,
                trailing: Text(
                  '${member.role}',
                ),
                title: const Text('役職'),
              ),
              ListTile(
                dense: true,
                trailing: SmoothStarRating(
                    allowHalfRating: false,
                    onRated: (v) {
                      logger.info('rating value -> $v');
                      context
                          .read<MemberStateController>()
                          .changeLevel(member.user.id, v);
                    },
                    starCount: 5,
                    rating: context.select<MemberState, double>((state) {
                      logger.info('update rating');
                      return state.members
                          .firstWhere((m) => m.user.id == member.user.id)
                          .level;
                    }),
                    size: 30,
                    isReadOnly: false,
                    color: Colors.orange,
                    borderColor: Colors.orange,
                    spacing: 0),
                title: const Text('レベル'),
              ),
              ListTile(
                dense: true,
                trailing: Text(
                  '${member.user.email}',
                ),
                title: const Text('電話'),
              ),
              //ListTile(),
            ],
          ),
        ),
      ),
    );
  }
}

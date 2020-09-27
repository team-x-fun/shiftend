import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/pages/member/member_state_controller.dart';
import 'package:shiftend/util/logger.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MemberDetailPage extends StatelessWidget {
  const MemberDetailPage(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
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
                        image: NetworkImage(user.iconUrl),
                      )),
                ),
              ),
              Text(
                user.name,
                style: const TextStyle(fontSize: 20),
              ),
              ListTile(
                dense: true,
                trailing: Text(
                  '${user.role}',
                ),
                title: const Text('役職'),
              ),
              ListTile(
                dense: true,
                trailing: SmoothStarRating(
                    allowHalfRating: false,
                    onRated: (v) {
                      logger.info('rating value -> $v');
                      context.read<MemberStateController>().changeLevel(v);
                    },
                    starCount: 5,
                    rating: context
                        .select<MemberState, double>((state) => state.level),
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
                  '${context.select<MemberState, String>((state) => state.tel)}',
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

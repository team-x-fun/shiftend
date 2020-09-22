import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/pages/member/member_state_controller.dart';
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
                      print('rating value -> $v');
                      if (v !=
                          Provider.of<MemberState>(context, listen: false)
                              .level) {
                        Provider.of<MemberStateController>(context,
                                listen: false)
                            .changeLevel(v);
                      }
                    },
                    starCount: 5,
                    rating:
                        Provider.of<MemberState>(context, listen: false).level,
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
                  '${Provider.of<MemberState>(context, listen: false).tel}',
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

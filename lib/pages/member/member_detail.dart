import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_provider.dart';
import 'widgets/level_stars_widget.dart';

class MemberDitailPage extends StatelessWidget {
  const MemberDitailPage(this.user, this.model);

  final User user;
  final MemberProvider model;

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
                trailing: LevelStars(
                  level: model.level,
                ),
                title: const Text('レベル'),
              ),
              ListTile(
                dense: true,
                trailing: Text(
                  '${model.tel}',
                ),
                title: const Text('電話'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

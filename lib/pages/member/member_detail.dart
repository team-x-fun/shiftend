import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/pages/setting/setting_account_item.dart';
import 'package:shiftend/pages/setting/setting_header_item.dart';
import 'package:shiftend/pages/setting/setting_list_item.dart';
import 'package:shiftend/pages/setting/setting_logout_item.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_provider.dart';

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
              // アカウント
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
                  '${model.level}',
                ),
                title: const Text('レベル'),
                //subtitle: Text(user.role),
              ),
              ListTile(
                dense: true,
                trailing: Text(
                  '${model.tel}',
                ),
                title: const Text('Tel'),
                //subtitle: Text(user.role),
              ),
              // お知らせ
              //const SettingHeaderItem('お知らせ'),
              //const SettingListItem('運営からのお知らせ'),
            ],
          ),
        ),
      ),
    );
  }
}

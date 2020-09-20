import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:shiftend/pages/setting/setting_account_item.dart';
import 'package:shiftend/pages/setting/setting_header_item.dart';
import 'package:shiftend/pages/setting/setting_list_item.dart';
import 'package:shiftend/pages/setting/setting_logout_item.dart';
import 'package:shiftend/pages/setting_org/setting_org_page.dart';
import 'package:shiftend/pages/setting_org/setting_org_state.dart';
import 'package:shiftend/pages/setting_org/setting_org_state_controller.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        title: const Text(
          'その他',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // アカウント
              const SettingHeaderItem('アカウント'),
              // const SettingAccountItem(),

              // お知らせ
              const SettingHeaderItem('お知らせ'),
              SettingListItem(
                detailTitle: '運営からのお知らせ',
                onTapItem: () {},
              ),

              // 設定
              const SettingHeaderItem('設定'),
              SettingListItem(
                detailTitle: 'カレンダーの設定',
                onTapItem: () {},
              ),
              SettingListItem(
                detailTitle: '組織の設定',
                onTapItem: () {
                  Navigator.push<SettingOrgPage>(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              StateNotifierProvider<SettingOrgStateController,
                                      SettingOrgState>(
                                  create: (context) =>
                                      SettingOrgStateController(),
                                  child: SettingOrgPage())));
                },
              ),

              // ヘルプ
              const SettingHeaderItem('ヘルプ'),
              SettingListItem(
                detailTitle: '使い方を見る',
                onTapItem: () {},
              ),

              // その他
              const SettingHeaderItem('その他'),
              SettingListItem(
                detailTitle: 'このアプリを評価する',
                onTapItem: () {},
              ),
              SettingListItem(
                detailTitle: 'このアプリについて',
                onTapItem: () {},
              ),
              SettingLogoutItem(),
            ],
          ),
        ),
      ),
    );
  }
}

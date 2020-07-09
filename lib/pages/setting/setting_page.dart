import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/pages/setting/setting_account_item.dart';
import 'package:shiftend/pages/setting/setting_header_item.dart';
import 'package:shiftend/pages/setting/setting_list_item.dart';

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
              const SettingAccountItem('松山', 'hogehoge@gmail.com',
                  'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg'),

              // お知らせ
              const SettingHeaderItem('お知らせ'),
              const SettingListItem('運営からのお知らせ'),

              // 設定
              const SettingHeaderItem('設定'),
              const SettingListItem('カレンダーの設定'),

              // ヘルプ
              const SettingHeaderItem('ヘルプ'),
              const SettingListItem('使い方を見る'),

              // その他
              const SettingHeaderItem('その他'),
              const SettingListItem('このアプリを評価する'),
              const SettingListItem('このアプリについて'),
              const SettingListItem('ログアウト'),
            ],
          ),
        ),
      ),
    );
  }
}

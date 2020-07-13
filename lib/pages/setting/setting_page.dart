import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/pages/setting/setting_account_item.dart';
import 'package:shiftend/pages/setting/setting_header_item.dart';
import 'package:shiftend/pages/setting/setting_list_item.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          // アカウント
          SettingHeaderItem('アカウント'),
          SettingAccountItem('松山', 'hogehoge@gmail.com',
              'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg'),

          // お知らせ
          SettingHeaderItem('お知らせ'),
          SettingListItem('運営からのお知らせ'),

          // 設定
          SettingHeaderItem('設定'),
          SettingListItem('カレンダーの設定'),

          // ヘルプ
          SettingHeaderItem('ヘルプ'),
          SettingListItem('使い方を見る'),

          // その他
          SettingHeaderItem('その他'),
          SettingListItem('このアプリを評価する'),
          SettingListItem('このアプリについて'),
          SettingListItem('ログアウト'),
        ],
      ),
    );
  }
}

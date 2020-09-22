import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';

class SettingOrgPage extends StatelessWidget {
  var _hasBeenCalled = false;
  final _items = <Widget>[
    Container(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: const Text(
        '組織名の変更',
        style: TextStyle(fontSize: 16),
      ),
    ),
    Container(
      padding: const EdgeInsets.only(left: 16),
      width: 100,
      child: const TextField(
        decoration: InputDecoration(labelText: '組織名'),
      ),
    ),
    const Divider(),
    FlatButton(
      child: const Text('更新'),
      onPressed: () {
        // TODO 更新する処理
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final members =
        context.select<SettingOrgState, List<User>>((state) => state.members);
    debugPrint('ここだよ');
    if (members.isNotEmpty) {
      _items.add(
        Container(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: const Text(
            'メンバーの削除',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }
    // ignore: cascade_invocations
    members.forEach((member) {
      _items.add(
        ListTile(
          title: Text(member.name),
          subtitle: Text(member.email),
          trailing: FlatButton(
            onPressed: () {
              // TODO メンバーを削除する処理
            },
            child: const Text('削除'),
          ),
        ),
      );
    });
    if (context.select<SettingOrgState, NotifierState>(
            (state) => state.notifierState) ==
        NotifierState.loaded) {
      _items
        ..add(
          Container(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: const Text(
              '定休日の編集',
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
        ..add(
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('定休日の追加'),
            onTap: () {
              // TODO 定休日を追加するダイアログ表示
            },
          ),
        );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('組織の設定'),
      ),
      body: context.select<SettingOrgState, NotifierState>(
                  (state) => state.notifierState) ==
              NotifierState.loaded
          ? ListView.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext _, int index) {
                return _items[index];
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

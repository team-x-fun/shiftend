import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/setting_org/setting_org_state.dart';
import 'package:shiftend/pages/setting_org/setting_org_state_controller.dart';

class SettingOrgPage extends StatelessWidget {
  final _items = <Widget>[
    Container(
      padding: const EdgeInsets.only(left: 16),
      width: 100,
      child: const TextField(
        decoration: InputDecoration(labelText: '組織名'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<SettingOrgState>(context, listen: true)
        .members
        .forEach((member) {
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
      _items..add(const Divider());
      _items.add(FlatButton(
        onPressed: () {
          // TODO 更新する処理
          Navigator.pop(context);
        },
        child: const Text('更新'),
      ));
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('組織の設定'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext _, int index) {
          return _items[index];
        },
      ),
    );
  }
}

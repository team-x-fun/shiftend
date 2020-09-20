import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

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
    final members = [
      const User(
          id: '0',
          email: 'member1@example.com',
          name: 'member 1',
          role: 'アルバイト',
          level: '20',
          iconUrl: 'https://avatars0.githubusercontent.com/u/57802072'),
      const User(
          id: '0',
          email: 'member2@example.com',
          name: 'member 2',
          role: 'アルバイト',
          level: '20',
          iconUrl: 'https://avatars0.githubusercontent.com/u/57802072'),
      const User(
          id: '0',
          email: 'member3@example.com',
          name: 'member 3',
          role: 'アルバイト',
          level: '20',
          iconUrl: 'https://avatars0.githubusercontent.com/u/57802072'),
      const User(
          id: '0',
          email: 'member4@example.com',
          name: 'member 4',
          role: 'アルバイト',
          level: '20',
          iconUrl: 'https://avatars0.githubusercontent.com/u/57802072')
    ];
    // ignore: cascade_invocations
    members.forEach((member) {
      _items.add(ListTile(
        title: Text(member.name),
        subtitle: Text(member.email),
        trailing: FlatButton(
          onPressed: () {
            // TODO 組織からメンバーを削除する処理
          },
          child: Text('削除'),
        ),
      ));
    });
    _items
      ..add(const Divider())
      ..add(Center(
        child: Container(
          width: 80,
          child: FlatButton(
            color: Colors.grey[400],
            onPressed: () {
              // TODO FireStoreで組織名更新する処理
            },
            child: const Text('更新'),
          ),
        ),
      ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('組織の設定'),
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext _, int index) {
            return _items[index];
          }),
    );
  }
}

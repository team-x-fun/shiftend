import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/member/member_provider.dart';

class MemberLevelDialog extends StatelessWidget {
  const MemberLevelDialog(this.user, this.model);

  final User user;
  final MemberProvider model;

  @override
  Widget build(BuildContext context) {
    final userLevel = TextEditingController();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text('${user.name}さんのレベル'),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              autofocus: true,
              controller: userLevel,
              decoration: const InputDecoration(
                labelText: 'レベルの入力',
              ),
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              maxLength: 10,
              maxLengthEnforced: true,
              maxLines: 1,
            ),
          ),
          const Text(
            'Level',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            child: const Text('戻る'),
            onPressed: () => {
                  print('「戻る」ボタン押した'),
                  Navigator.of(context).pop(),
                }),
        FlatButton(
            child: const Text('追加'),
            onPressed: () => {
                  print('「追加」ボタン押した'),
                  model.changeLevel(userLevel.text),
                  Navigator.of(context).pop(),
                }),
      ],
    );
  }
}

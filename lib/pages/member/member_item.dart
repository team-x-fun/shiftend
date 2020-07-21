import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:flutter/services.dart';
import 'member_provider.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final userLevel = TextEditingController();
    return ChangeNotifierProvider<MemberProvider>(
      create: (_) => MemberProvider(),
      child: Column(
        children: <Widget>[
          Consumer<MemberProvider>(builder: (context, model, child) {
            return FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const RoundedRectangleBorder(),
              color: Colors.grey[50],
              padding: const EdgeInsets.all(0),
              onPressed: () async {
                await showDialog<int>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
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
                  },
                );
              },
              child: Container(
                child: ListTile(
                  dense: true,
                  trailing: Text(
                    '${model.level}',
                    style: TextStyle(
                        color: model.levelInputFlag ? Colors.black54 : Colors.grey[400]),
                  ),
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(user.iconUrl),
                      ),
                    ),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.role),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

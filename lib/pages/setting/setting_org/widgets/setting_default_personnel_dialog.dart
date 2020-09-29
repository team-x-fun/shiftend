import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state_controller.dart';
import 'package:shiftend/util/logger.dart';

class SettingDefaultPersonnelDialog extends StatelessWidget {
  const SettingDefaultPersonnelDialog();

  @override
  Widget build(BuildContext context) {
    final defaultPersonnel = context
        .select<SettingOrgState, Personnel>((state) => state.defaultPersonnel);
    int number = defaultPersonnel.number;
    int totalLevel = defaultPersonnel.totalLevel;
    return AlertDialog(
      title: const Text('基本要員の編集'),
      content: Column(
        children: <Widget>[
          TextFormField(
            initialValue: defaultPersonnel.number.toString(),
            decoration: const InputDecoration(
              icon: Icon(Icons.people),
              labelText: '必要要員',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            onChanged: (String value) {
              try {
                number = int.parse(value);
              } on Exception {
                logger.warning('int 以外の入力値: $value');
              }
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'IDは必須入力項目です．';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: defaultPersonnel.totalLevel.toString(),
            decoration: const InputDecoration(
              icon: Icon(Icons.star),
              labelText: '必要総合レベル',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            onChanged: (String value) {
              try {
                totalLevel = int.parse(value);
              } on Exception {
                logger.warning('int 以外の入力値: $value');
              }
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'IDは必須入力項目です．';
              }
              return null;
            },
          ),
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('戻る'),
        ),
        FlatButton(
          onPressed: () {
            context.read<SettingOrgStateController>().changeDefaultPersonnel(
                  defaultPersonnel.copyWith(
                    number: number,
                    totalLevel: totalLevel,
                  ),
                );
            Navigator.pop(context);
          },
          child: const Text('確定'),
        ),
      ],
    );
  }
}

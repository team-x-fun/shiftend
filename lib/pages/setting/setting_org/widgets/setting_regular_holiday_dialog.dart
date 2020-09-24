import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state_controller.dart';

class SettingRegularHolidayDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('定休日の追加'),
      content: Wrap(
        children: [
          Checkbox(
            activeColor: Colors.blue,
            value:
                Provider.of<SettingOrgState>(context).selectableDayOfWeeks[0],
            onChanged: (bool value) =>
                Provider.of<SettingOrgStateController>(context, listen: false)
                    .changeSelectableDayOfWeek(value, 0),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: const Text('キャンセル'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('作成'),
          onPressed: () {
            Navigator.pop(context);
            // TODO 作成する処理
          },
        )
      ],
    );
  }
}

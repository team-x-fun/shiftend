import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state_controller.dart';
import 'package:shiftend/pages/setting/setting_org/widgets/setting_default_personnel_dialog.dart';

class DefaultPersonnelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultPersonnel = context
        .select<SettingOrgState, Personnel>((state) => state.defaultPersonnel);
    return Column(
      children: <Widget>[
        Container(
          child: const Text(
            '基本要員',
            style: TextStyle(fontSize: 16),
          ),
        ),
        FlatButton(
          child: const Text('編集'),
          onPressed: () {
            showDialog<Widget>(
              context: context,
              builder: (_) => StateNotifierProvider<SettingOrgStateController,
                  SettingOrgState>.value(
                value: context.read<SettingOrgStateController>(),
                child: const SettingDefaultPersonnelDialog(),
              ),
            );
          },
        ),
        ListTile(
          title: Text('必要人員 ${defaultPersonnel?.number}'),
        ),
        ListTile(
          title: Text('必要総合レベル ${defaultPersonnel?.totalLevel}'),
        ),
      ],
    );
  }
}

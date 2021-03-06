import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state_controller.dart';
import 'package:shiftend/pages/setting/setting_org/widgets/setting_regular_holiday_dialog.dart';
import 'package:shiftend/pages/setting/setting_org/widgets/default_personnel_widget.dart';
import 'package:shiftend/util/formatters.dart';

class SettingOrgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    final members =
        context.select<SettingOrgState, List<Member>>((state) => state.members);
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
          title: Text(member.user.name),
          subtitle: Text(member.user.email),
          trailing: FlatButton(
            onPressed: () {
              // TODO メンバーを削除する処理
            },
            child: const Text('削除'),
          ),
        ),
      );
    });
    final holidays = context
        .select<SettingOrgState, List<Holiday>>((state) => state.holidays);
    if (context.select<SettingOrgState, NotifierState>(
                (state) => state.notifierState) ==
            NotifierState.loaded &&
        holidays.isNotEmpty) {
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
              showDialog<Widget>(
                context: context,
                builder: (_) => StateNotifierProvider<SettingOrgStateController,
                        SettingOrgState>.value(
                    value: Provider.of<SettingOrgStateController>(context),
                    child: SettingRegularHolidayDialog(
                      holidays: holidays,
                    )),
              );
            },
          ),
        );
      for (int i = 0; i < holidays.length; i++) {
        _items.add(ListTile(
          title: Text(
            toRegularHoliday(holidays[i].dayOfWeek, holidays[i].nWeek),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Provider.of<SettingOrgStateController>(context, listen: false)
                  .removeRegularHoliday(holidays[i]);
            },
          ),
        ));
      }
    }

    _items.add(DefaultPersonnelWidget());

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

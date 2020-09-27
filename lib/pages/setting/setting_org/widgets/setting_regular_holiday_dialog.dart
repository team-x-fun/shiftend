import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/holiday/holiday.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state_controller.dart';

class SettingRegularHolidayDialog extends StatelessWidget {
  const SettingRegularHolidayDialog({@required this.holidays});

  final List<Holiday> holidays;
  @override
  Widget build(BuildContext context) {
    final jpDateSymbols = dateTimeSymbolMap()['ja'] as DateSymbols;
    final weekDays = jpDateSymbols.STANDALONEWEEKDAYS;
    final intervalsRegularHolidays = ['毎週', '第1', '第2', '第3', '第4'];
    return AlertDialog(
      title: const Text('定休日の追加'),
      content: SingleChildScrollView(
        child: Wrap(
          children: [
            for (int i = 0; i < 7; i++)
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.blue,
                    value: Provider.of<SettingOrgState>(context)
                        .selectedDayOfWeeks[i],
                    onChanged: (bool value) =>
                        Provider.of<SettingOrgStateController>(context,
                                listen: false)
                            .changeSelectedDayOfWeek(
                                value: value, dayOfWeekPosition: i),
                  ),
                  Text(weekDays[i]),
                ],
              ),
            const Divider(),
            for (int i = 0; i < 5; i++)
              Row(
                children: [
                  Radio(
                    activeColor: Colors.blue,
                    value: i,
                    groupValue: Provider.of<SettingOrgState>(context)
                        .intervalRegularHoliday,
                    onChanged: (Object value) =>
                        Provider.of<SettingOrgStateController>(context,
                                listen: false)
                            .changeIntervalRegularHoliday(value),
                  ),
                  Text(intervalsRegularHolidays[i]),
                ],
              )
          ],
        ),
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
            Provider.of<SettingOrgStateController>(context, listen: false)
                .addRegularHoliday();
          },
        )
      ],
    );
  }
}

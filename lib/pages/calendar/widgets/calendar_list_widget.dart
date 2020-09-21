import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_item_widget.dart';
import 'package:shiftend/pages/calendar_addshift/calendar_addshift_page.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';
import 'package:shiftend/util/logger.dart';

class CalendarListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [];
    final shifts = context
        .select<CalendarState, List<Shift>>((state) => state.selectedShifts);
    final shifts =
        Provider.of<CalendarState>(context, listen: true).selectedShifts;
    final requestedShifts =
        Provider.of<CalendarState>(context).selectedRequestedShifts;
    if (shifts.isNotEmpty) {
      logger.info('きた $shifts');
      shifts.forEach(
        (shift) {
          listItems.add(
            CalendarListItemWidget(
              shift: shift,
            ),
          );
        },
      );
    }
    listItems.add(
      ListTile(
        leading: const Icon(Icons.add),
        title: const Text('アルバイトを追加する'),
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute<CalenderAddShiftPage>(
              builder: (context) => CalenderAddShiftPage(shiftlist: shifts, requestShiftlist: requestedShifts,),
            )
          )
        },
      ),
    );
    return ListView(
        children: listItems,
    );
    }
  }


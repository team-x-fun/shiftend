import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_item_widget.dart';
import 'package:shiftend/util/logger.dart';

class CalendarListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [];
    final shifts = context
        .select<CalendarState, List<Shift>>((state) => state.selectedShifts);
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
    return ListView(
      children: listItems,
    );
  }
}

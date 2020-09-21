import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_item_widget.dart';

class CalendarShiftRequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [];
    final List<Shift> shifts = Provider.of<CalendarState>(context, listen: true)
        .loggedinUserRequestedShifts;
    if (shifts.isNotEmpty) {
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

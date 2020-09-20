import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_item_widget.dart';

class CalendarDesiredShiftWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [];
    final List<Shift> shifts = [];
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

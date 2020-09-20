import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_item_widget.dart';

class CalendarListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [];
    final shifts =
        Provider.of<CalendarState>(context, listen: true).selectedShifts;
    if (shifts.isNotEmpty) {
      print('きた $shifts');
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_item_widget.dart';

class CalendarListWidget extends StatelessWidget {
  const CalendarListWidget({this.shifts});

  final List<Shift> shifts;

  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [
      Container(
        color: Colors.grey[300],
        child: const Text('出勤情報'),
      ),
    ];
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

class CalendarListWidget extends StatelessWidget {
  const CalendarListWidget({this.shifts});

  final List<Shift> shifts;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    if (shifts != null) {
      child = ListView(
        children: shifts
            .map(
              (shift) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(shift.toString()),
                  onTap: () => print('$shift tapped'),
                ),
              ),
            )
            .toList(),
      );
    }
    return child;
  }
}

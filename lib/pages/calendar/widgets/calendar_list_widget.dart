import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

class CalendarListWidget extends StatelessWidget {
  const CalendarListWidget({this.attendees});

  final List<User> attendees;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    if (attendees != null) {
      child = ListView(
        children: attendees
            .map(
              (attendee) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(attendee.toString()),
                  onTap: () => print('$attendee tapped'),
                ),
              ),
            )
            .toList(),
      );
    }
    return child;
  }
}

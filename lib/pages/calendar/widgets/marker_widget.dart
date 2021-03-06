import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({this.date, this.attendees});

  final DateTime date;
  final List attendees;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.pink,
//        color: _calendarController.isSelected(date)
//            ? Colors.brown[500]
//            : _calendarController.isToday(date)
//                ? Colors.brown[300]
//                : Colors.blue[400],
      ),
      width: 16,
      height: 16,
      child: Center(
        child: Text(
          '${attendees.length}',
          style: const TextStyle().copyWith(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

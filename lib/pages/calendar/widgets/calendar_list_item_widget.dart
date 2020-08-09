import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/util/formatters.dart';

class CalendarListItemWidget extends StatelessWidget {
  const CalendarListItemWidget({this.shift});

  final Shift shift;
  @override
  Widget build(BuildContext context) {
    final String shiftTime =
        '${fullDateToTime(shift.start)}〜${fullDateToTime(shift.end)}';
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(shift.user.iconUrl),
            ),
          ),
        ),
        title: Text(shift.user.name),
        subtitle: Text(shiftTime),
        onTap: () => {
          print('タップされた $shift'),
        },
      ),
    );
  }
}

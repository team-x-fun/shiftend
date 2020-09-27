import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/util/formatters.dart';
import 'package:shiftend/util/logger.dart';

class CalendarListItemWidget extends StatelessWidget {
  const CalendarListItemWidget({this.shift});

  final Shift shift;
  @override
  Widget build(BuildContext context) {
    final String shiftTime =
        '${extractTime(shift.start)}〜${extractTime(shift.end)}';

    final Color color =
        context.select<LoginState, String>((state) => state.currentUser.id) ==
                shift.user.id
            ? Colors.blueGrey[100]
            : Colors.white;
    return Container(
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
          logger.info('タップされた $shift'),
        },
      ),
      color: color,
    );
  }
}

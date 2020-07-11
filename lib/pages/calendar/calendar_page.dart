import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_widget.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_widget.dart';
import 'package:shiftend/util/formatters.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CalendarWidget(
              calendarController: _calendarController,
              animationController: _animationController,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 20),
              child: Container(
                color: Colors.grey[300],
                child: Text(fullDateToJa(
                    Provider.of<CalendarState>(context, listen: true)
                        .selectedDate)),
              ),
            ),
            Expanded(
              child: CalendarListWidget(
                attendees:
                    Provider.of<CalendarState>(context).selectedAttendees,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

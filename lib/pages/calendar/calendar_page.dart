import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
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
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
//            _buildTableCalendar(),
            CalendarWidget(
              calendarController: _calendarController,
              animationController: _animationController,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 20),
              child: Container(
                color: Colors.grey[300],
                child: Text(fullDateToJa(
                    Provider.of<CalendarState>(context, listen: true)
                        .selectedDate)),
              ),
            ),
            Expanded(
              child: _buildAttendanceList(
                  Provider.of<CalendarState>(context).selectedAttendees),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceList(List<User> selectedAttendees) {
    Widget child = Container(
      color: Colors.pink,
    );
    if (selectedAttendees != null) {
      child = ListView(
        children: selectedAttendees
            .map<Container>(
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

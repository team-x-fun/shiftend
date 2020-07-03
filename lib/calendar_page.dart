import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  Map<DateTime, List<String>> _attendees;
  List<String> _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  final DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _attendees = {
      DateTime.parse('2020-07-03'): ['UserA', 'UserB', 'UserC'],
    };
    _selectedEvents = _attendees[_selectedDay] ?? [];
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

  void _onDaySelected(DateTime day, List<String> events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTableCalendar(),
          ConstrainedBox(
            constraints: BoxConstraints.expand(height: 20),
            child: Container(
              color: Colors.grey[300],
              child: Text(
                  '${_selectedDate.year}年${_selectedDate.month}月${_selectedDate.day}日（${_selectedDate.weekday}）'),
            ),
          ),
          Expanded(
            child: _buildAttendanceList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'ja_JP',
      calendarController: _calendarController,
      events: _attendees,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      calendarStyle: CalendarStyle(
        selectedStyle: TextStyle().copyWith(color: Colors.amberAccent),
        outsideDaysVisible: true,
        weekdayStyle: TextStyle().copyWith(color: Colors.black),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle().copyWith(color: Colors.black),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
        formatButtonShowsNext: true,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            // 日付選択されたときのレイアウト
            child: Container(
              decoration: BoxDecoration(
//                color: Colors.red,
                shape: BoxShape.circle,
                color: (date.year == DateTime.now().year &&
                        date.month == DateTime.now().month &&
                        date.day == DateTime.now().day)
                    ? Colors.blue
                    : Colors.white.withOpacity(1),
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey,
                ),
              ),
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          // 今日を表すレイアウト
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.all(4.0),
//            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//            color: const Color(0xFFEDFAF1),
            width: 100,
            height: 100,
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];
          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }
          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events.cast<String>());
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle, color: Colors.pink,
//        color: _calendarController.isSelected(date)
//            ? Colors.brown[500]
//            : _calendarController.isToday(date)
//                ? Colors.brown[300]
//                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceList() {
    return ListView(
      children: _selectedEvents
          .map(
            (event) => Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.8),
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: ListTile(
                title: Text(event.toString()),
                onTap: () => print('$event tapped!'),
              ),
            ),
          )
          .toList(),
    );
  }
}

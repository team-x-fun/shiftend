import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

// TODO: あとでfreezed+StateNotifierを使ってStatelessWidgetにする
class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  // TODO: あとでMap<DateTime, List<User>>に変える
  Map<DateTime, List<String>> _attendees;
  List<String> _selectedAttendees;
  AnimationController _animationController;
  CalendarController _calendarController;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _attendees = {
      DateTime.parse('2020-07-03'): ['UserA', 'UserB', 'UserC'],
      DateTime.parse('2020-07-10'): ['UserA', 'UserB', 'UserC'],
      DateTime.parse('2020-07-20'): ['UserA'],
      DateTime.parse('2020-07-22'): ['UserA', 'UserB'],
    };
    _selectedAttendees = _attendees[_selectedDay] ?? [];
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

  void _onDaySelected(DateTime day, List<String> attendees) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedDate = day;
      _selectedAttendees = attendees;
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
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildTableCalendar(),
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 20),
              child: Container(
                color: Colors.grey[300],
                child: Text(
                    // TODO: 曜日がただの数字だから後で曜日コンバーター的なの作って変換するようにする
                    '${_selectedDate.year}年${_selectedDate.month}月${_selectedDate.day}日（${_selectedDate.weekday}）'),
              ),
            ),
            Expanded(
              child: _buildAttendanceList(),
            ),
          ],
        ),
      ),
    );
  }

  // TODO: この辺もStatelessにしたときにファイルわける
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
        outsideDaysVisible: true,
        outsideWeekendStyle: TextStyle().copyWith(color: Colors.black),
        weekdayStyle: TextStyle().copyWith(color: Colors.black),
        weekendStyle: TextStyle().copyWith(color: Colors.black),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle().copyWith(color: Colors.black),
        weekendStyle: TextStyle().copyWith(color: Colors.black),
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
        markersBuilder: (context, date, attendees, holidays) {
          final children = <Widget>[];
          if (attendees.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildAttendeesMarker(date, attendees),
              ),
            );
          }
          return children;
        },
      ),
      onDaySelected: (date, attendees) {
        _onDaySelected(date, attendees.cast<String>());
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildAttendeesMarker(DateTime date, List attendees) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.pink,
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
          '${attendees.length}',
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
      children: _selectedAttendees
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
                onTap: () => print('$attendee tapped!'),
              ),
            ),
          )
          .toList(),
    );
  }
}

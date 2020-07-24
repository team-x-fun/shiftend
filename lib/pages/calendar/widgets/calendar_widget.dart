import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/calendar_state_controller.dart';
import 'package:shiftend/pages/calendar/widgets/marker_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({this.calendarController, this.animationController});

  @required
  final CalendarController calendarController;
  @required
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ja_JP',
      calendarController: calendarController,
      events: Provider.of<CalendarState>(context, listen: true).shifts,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.horizontalSwipe,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        outsideWeekendStyle: const TextStyle().copyWith(color: Colors.black),
        weekdayStyle: const TextStyle().copyWith(color: Colors.black),
        weekendStyle: const TextStyle().copyWith(color: Colors.black),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: const TextStyle().copyWith(color: Colors.black),
        weekendStyle: const TextStyle().copyWith(color: Colors.black),
      ),
      headerStyle: const HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
        formatButtonShowsNext: true,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity:
                Tween<double>(begin: 0, end: 1).animate(animationController),
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
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.only(top: 5, left: 6),
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: const TextStyle().copyWith(fontSize: 16),
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
            margin: const EdgeInsets.all(4),
//            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//            color: const Color(0xFFEDFAF1),
            width: 100,
            height: 100,
            child: Center(
              child: Text(
                '${date.day}',
                style: const TextStyle().copyWith(fontSize: 16),
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
                child: MarkerWidget(
                  date: date,
                  attendees: attendees,
                ),
              ),
            );
          }
          return children;
        },
      ),
      onDaySelected: (date, attendees) {
        Provider.of<CalendarStateController>(context, listen: false)
            .onDaySelected(date, attendees.cast<Shift>());
        animationController.forward(from: 0);
      },
      onVisibleDaysChanged: (first, last, format) {
        Provider.of<CalendarStateController>(context, listen: false)
            .fetchShiftsOfMonth(last);
      },
    );
  }
}

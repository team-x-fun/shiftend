import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/calendar_state_controller.dart';
import 'package:shiftend/pages/calendar/widgets/marker_widget.dart';
import 'package:shiftend/util/logger.dart';
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
      events: context.select<CalendarState, Map<DateTime, List<Shift>>>(
          (state) => state.shifts),
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.horizontalSwipe,
      calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          // trueにすると月を切り替えたときにマーカーが表示されなくなる
          outsideHolidayStyle: const TextStyle(decorationColor: Colors.grey),
          weekdayStyle: const TextStyle().copyWith(color: Colors.red),
          weekendStyle: const TextStyle().copyWith(color: Colors.red),
          selectedStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
          final isSaturday = date.weekday == DateTime.saturday;
          final isSunday = date.weekday == DateTime.sunday;
          final today = DateTime.now();
          final isToday = today.year == date.year &&
              today.month == date.month &&
              today.day == date.day;
          final dayColor = isSaturday
              ? Colors.blueAccent
              : isSunday
                  ? Colors.redAccent
                  : Colors.black;
          final dayFontWeight = isToday ? FontWeight.bold : FontWeight.normal;

          return FadeTransition(
            opacity:
                Tween<double>(begin: 0, end: 1).animate(animationController),
            // 日付選択されたときのレイアウト
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white.withOpacity(0),
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                margin: const EdgeInsets.all(2),
                width: 100,
                height: 100,
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: const TextStyle().copyWith(
                      fontSize: 16,
                      color: dayColor,
                      fontWeight: dayFontWeight,
                    ),
                  ),
                )),
          );
        },
        todayDayBuilder: (context, date, _) {
          // 今日を表すレイアウト
          final isSaturday = date.weekday == DateTime.saturday;
          final isSunday = date.weekday == DateTime.sunday;
          final dayColor = isSaturday
              ? Colors.blueAccent
              : isSunday
                  ? Colors.redAccent
                  : Colors.black;

          return Container(
            margin: const EdgeInsets.all(2),
            child: Center(
              child: Text('${date.day}',
                  style: const TextStyle()
                      .copyWith(color: dayColor, fontWeight: FontWeight.bold)),
            ),
          );
        },
        dayBuilder: (context, date, events) {
          final isSaturday = date.weekday == DateTime.saturday;
          final isSunday = date.weekday == DateTime.sunday;
          final dayColor = isSaturday
              ? Colors.blueAccent
              : isSunday
                  ? Colors.redAccent
                  : Colors.black;
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white.withOpacity(0),
            ),
            margin: const EdgeInsets.all(2),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${date.day}',
                style: const TextStyle().copyWith(color: dayColor),
              ),
            ),
          );
        },
        markersBuilder: (context, date, attendees, holidays) {
          final children = <Widget>[];
          if (attendees.isNotEmpty) {
            children.add(
              Positioned(
                right: 4,
                bottom: 4,
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
        final selectedRequestedShifts = context
            .read<CalendarState>()
            .requestedShifts[DateTime(date.year, date.month, date.day)];
        logger.info(selectedRequestedShifts);
        context.read<CalendarStateController>().onDaySelected(
            date, attendees.cast<Shift>(), selectedRequestedShifts);
        Provider.of<CalendarStateController>(context, listen: false);
        context
            .read<CalendarStateController>()
            .fetchLoggedinUserRequestedShifts(date);
        animationController.forward(from: 0);
      },
      onVisibleDaysChanged: (first, last, format) {
        context.read<CalendarStateController>().fetchShiftsOfMonth(last);
      },
    );
  }
}

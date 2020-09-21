import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_shift_request_widget.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_tab_widget.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_widget.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_widget.dart';
import 'package:shiftend/util/formatters.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_bottom_tab.dart';
import 'widgets/calendar_list_tab_widget.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

final tabs = [
  CalendarBottomTab(label: '出勤情報', body: CalendarListWidget()),
  CalendarBottomTab(label: 'あなたの出勤希望', body: CalendarShiftRequestWidget()),
];

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..forward();

    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<CalendarState>(context, listen: true).notifierState ==
        NotifierState.loaded) {
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
              CalenderListTabWidget(
                tabController: _tabController,
                tabs: tabs,
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

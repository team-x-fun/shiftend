import 'package:flutter/material.dart';
import 'package:shiftend/pages/calendar/calendar_bottom_tab.dart';

class CalenderListTabWidget extends StatelessWidget {
  const CalenderListTabWidget(
      {@required this.tabController, @required this.tabs});

  final TabController tabController;
  final List<CalendarBottomTab> tabs;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double tabWidth = width / tabs.length;

    return Expanded(
        child: Column(
      children: [
        TabBar(
          isScrollable: true,
          labelColor: Colors.black87,
          controller: tabController,
          tabs: tabs
              .map((tab) =>
                  Container(width: tabWidth, child: Tab(text: tab.label)))
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: tabs.map((tab) => tab.body).toList(),
          ),
        )
      ],
    ));
  }
}

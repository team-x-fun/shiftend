import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/calendar_state_controller.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_item_widget.dart';
import 'package:shiftend/pages/addshift/addshift_page.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/util/logger.dart';

class CalendarListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [];
    final shifts = context
        .select<CalendarState, List<Shift>>((state) => state.selectedShifts);
    final requestedShifts = context.select<CalendarState, List<Shift>>(
        (state) => state.selectedRequestedShifts);
    final members = context
        .select<LoginState, List<Member>>((state) => state.selectedOrg.members);
    if (shifts.isNotEmpty) {
      logger.info('きた $shifts');
      shifts.forEach(
        (shift) {
          listItems.add(
            CalendarListItemWidget(
              shift: shift,
            ),
          );
        },
      );
    }
    listItems.add(
      ListTile(
        leading: const Icon(Icons.add),
        title: const Text('アルバイトを追加する'),
        onTap: () => {
          Navigator.push<AddShiftPage>(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => StateNotifierProvider<
                        CalendarStateController, CalendarState>(
                      create: (_) => CalendarStateController(),
                      child: AddShiftPage(
                        shiftlist: shifts,
                        requestShiftlist: requestedShifts,
                        memberslist: members,
                      ),
                    )),
          )
        },
      ),
    );
    return ListView(
      children: listItems,
    );
  }
}

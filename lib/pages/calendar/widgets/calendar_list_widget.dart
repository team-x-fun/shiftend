import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/calendar/widgets/calendar_list_item_widget.dart';
import 'package:shiftend/pages/addshift/addshift_page.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/util/logger.dart';

class CalendarListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [];
    final shifts = context
        .select<CalendarState, List<Shift>>((state) => state.selectedShifts);
    final requestedShifts =
        Provider.of<CalendarState>(context).selectedRequestedShifts;
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
          Navigator.of(context).push(
            MaterialPageRoute<AddShiftPage>(
              builder: (context) =>AddShiftPage(shiftlist: shifts, requestShiftlist: requestedShifts, memberslist: members,),
            )
          )
        },
      ),
    );
    return ListView(
        children: listItems,
    );
    }
  }


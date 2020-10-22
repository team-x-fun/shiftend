import 'package:flutter/material.dart';
import 'package:shiftend/models/member/member.dart';
import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/models/user/user.dart';
import 'package:shiftend/pages/addshift/shift_item.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';
import 'package:shiftend/util/logger.dart';

import 'addshift_item.dart';

class AddShiftPage extends StatelessWidget {
  AddShiftPage(
      {Key key,
      @required this.shiftlist,
      @required this.requestShiftlist,
      @required this.memberslist})
      : super(key: key);

  final UserRepositoryInterface userRepository = UserRepositoryMock();
  final List<Shift> shiftlist;
  final List<Shift> requestShiftlist;
  final List<Member> memberslist;

  @override
  Widget build(BuildContext context) {
    final List<Widget> editedlist = [];
    logger..info(memberslist)..info(shiftlist);
    final noShiftMembers = memberslist
        .where((member) => !shiftlist
            .map((shift) => shift.member.user.id)
            .toSet()
            .contains(member.user.id))
        .toList();
    logger.info(noShiftMembers);
    editedlist.add(const Text('シフト入ってる人'));
    if (shiftlist != null) {
      shiftlist.forEach((shift) {
        editedlist.add(ShiftItem(member: shift.member));
      });
    }
    editedlist.add(const Text('シフト希望'));
    if (requestShiftlist != null) {
      requestShiftlist.forEach((requestedShift) {
        editedlist.add(AddShiftItem(member: requestedShift.member));
      });
    }
    editedlist.add(const Text('シフトなし'));
    if (noShiftMembers != null) {
      noShiftMembers.forEach((noShiftlist) {
        editedlist.add(AddShiftItem(member: noShiftlist));
      });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: const Text(
            'シフトの追加',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: userRepository.getUsers(),
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: editedlist.length,
                itemBuilder: (context, index) {
                  return editedlist[index];
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

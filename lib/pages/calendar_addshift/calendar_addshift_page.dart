import 'package:flutter/material.dart';
import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/models/user/user.dart';
import 'package:shiftend/pages/member/member_item.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';

import 'calendar_addshift_item.dart';

class CalenderAddShiftPage extends StatelessWidget {

  final UserRepositoryInterface userRepository = UserRepositoryMock();
  final List<Shift> shiftlist;
  CalenderAddShiftPage({Key key, @required this.shiftlist}) : super(key: key);
  final List<Widget> editedlist = [];

  @override
  Widget build(BuildContext context) {
    editedlist.add(Text('シフト入ってる人'));
    shiftlist.forEach((shift) {
      editedlist.add(CalendarAddShiftItem(user: shift.user));
    });
    editedlist.add(Text('シフト希望'));


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: const Text(
            'メンバー',
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
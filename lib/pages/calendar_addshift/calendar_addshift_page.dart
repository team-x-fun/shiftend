import 'package:flutter/material.dart';
import 'package:shiftend/models/user/user.dart';
import 'package:shiftend/pages/member/member_item.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';

import 'calendar_addshift_item.dart';

class CalenderAddShiftPage extends StatelessWidget {

  final UserRepositoryInterface userRepository = UserRepositoryMock();
  @override
  Widget build(BuildContext context) {
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
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return CalendarAddShiftItem(user: snapshot.data[index]);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
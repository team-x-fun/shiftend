import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/member_item.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';
import 'package:shiftend/models/models.dart';

class MemberPage extends StatelessWidget {
  final UserRepositoryInterface userRepository = UserRepositoryMock();
  @override
  Widget build(BuildContext context) async {
    List<User> _users = await userRepository.getUsers(); 
    // asyncとawatは別関数で管理する必要がある？
    return Scaffold(
      body: ListView.builder(
        //itemCount: _mockData.length,
        itemBuilder: (context, int index) {
          return MemberItem(member: _users[index]);
        },
      ),
    );
  }
}

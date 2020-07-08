import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/member_item.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';
import 'package:shiftend/models/models.dart';

class MemberPage extends StatelessWidget {
  final UserRepositoryInterface userRepository = UserRepositoryMock();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: userRepository.getUsers(),
      builder: (context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return MemberItem(user: snapshot.data[index]);
            },
          );
        }else{
          return Center(child:CircularProgressIndicator());
        }
      },
    ));
  }
}

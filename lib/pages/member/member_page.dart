import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/member/member_item.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';
import 'package:shiftend/models/models.dart';

import 'member_provider.dart';

class MemberPage extends StatelessWidget {
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
        body: ChangeNotifierProvider<MemberProvider>(
          create: (_) => MemberProvider(),
          child: FutureBuilder(
            future: userRepository.getUsers(),
            builder: (context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.hasData) {
                return Consumer<MemberProvider>(
                    builder: (context, model, child) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      // ignore: missing_required_param
                      return MemberItem(
                        user: snapshot.data[index],
                        model: model,
                      );
                    },
                  );
                });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}

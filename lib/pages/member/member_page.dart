import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:shiftend/pages/member/member_item.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/pages/member/member_state_controller.dart';
import 'package:shiftend/repositories/interfaces/interfaces.dart';
import 'package:shiftend/repositories/mocks/organization_repository_mock.dart';
import 'package:shiftend/models/models.dart';

class MemberPage extends StatelessWidget {
  final OrganizationRepositoryInterface orgRepo = OrganizationRepositoryMock();
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
        future: orgRepo.getOrganization('test_id'),
        builder: (context, AsyncSnapshot<Organization> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.members.length,
              itemBuilder: (context, index) {
                return StateNotifierProvider<MemberStateController,
                    MemberState>(
                  create: (_) => MemberStateController(),
                  child: MemberItem(
                    member: snapshot.data.members[index],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

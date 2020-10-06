import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/member/member_item.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/pages/member/member_state_controller.dart';
import 'package:shiftend/models/models.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final members = context
        .select<LoginState, List<Member>>((state) => state.selectedOrg.members);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: const Text(
          'メンバー',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return StateNotifierProvider<MemberStateController, MemberState>(
            create: (_) => MemberStateController(),
            child: MemberItem(
              member: members[index],
            ),
          );
        },
      ),
    );
  }
}

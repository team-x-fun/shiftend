import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/pages/member/member_item.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/models/models.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/util/logger.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logger.info('MemberPage build');
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
        itemCount: context.select<MemberState, int>(
          (state) => state.members.length,
        ),
        itemBuilder: (context, index) {
          return Builder(
            builder: (context) => MemberItem(
              member: context.select<MemberState, Member>(
                (state) => state.members[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

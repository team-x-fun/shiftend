import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/pages/member/member_item.dart';
import 'package:shiftend/pages/member/member_state.dart';
import 'package:shiftend/models/models.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
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
      body: ListView.builder(
        itemCount: context
            .select<MemberState, List<Member>>((state) => state.members)
            .length,
        itemBuilder: (context, index) {
          return Builder(
            builder: (context) {
              return MemberItem(
                member: context.select<MemberState, List<Member>>(
                    (state) => state.members)[index],
              );
            },
          );
        },
      ),
    );
  }
}

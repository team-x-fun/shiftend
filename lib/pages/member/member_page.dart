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
    final memberStream = context.select<MemberState, Stream<List<Member>>>(
        (state) => state.membersStream);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: const Text(
          'メンバー',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: (memberStream == null)
          ? const Text('組織を選択してください．')
          : StreamBuilder(
              stream: memberStream,
              builder: (BuildContext _, AsyncSnapshot<List<Member>> snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Loading...');
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) => Builder(
                    builder: (context) => MemberItem(
                      member: snapshot.data[index],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

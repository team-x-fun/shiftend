import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/member.dart';
import 'package:shiftend/member_item.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const _mockData = [
      Member(
          iconUrl:
              'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
          name: '佐藤勇一郎',
          role: 'オーナー',
          level: '100'),
      Member(
          iconUrl:
              'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
          name: '工藤大輔',
          role: 'オナー',
          level: '100'),
      Member(
          iconUrl:
              'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
          name: '松山航',
          role: 'バイトリーダ',
          level: '100'),
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: _mockData.length,
        itemBuilder: (context, int index) {
          return MemberItem(member: _mockData[index]);
        },
      ),
    );
  }
}

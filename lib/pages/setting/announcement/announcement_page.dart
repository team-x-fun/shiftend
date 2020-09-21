import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お知らせ'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext _, int index) {
            return ListTile(
              title: Text('aaaa'),
              onTap: () {},
            );
          }),
    );
  }
}

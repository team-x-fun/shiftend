import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/setting/announcement/announcement_state.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final announcements =
        Provider.of<AnnouncementState>(context, listen: true).announcements;
    return Scaffold(
      appBar: AppBar(
        title: const Text('お知らせ'),
      ),
      body: ListView.builder(
          itemCount: announcements.length,
          itemBuilder: (BuildContext _, int index) {
            return ListTile(
              title: Text(announcements[index].title),
              onTap: () {},
            );
          }),
    );
  }
}

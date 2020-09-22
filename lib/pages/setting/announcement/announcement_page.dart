import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/announcement/announcement.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({@required this.announcement});
  final Announcement announcement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(announcement.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          if (announcement.imageUrl != '')
            Container(height: 240, child: Image.network(announcement.imageUrl)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(announcement.content),
          ),
        ],
      )),
    );
  }
}

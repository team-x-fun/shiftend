import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/announcement/announcement.dart';
import 'package:shiftend/pages/setting/announcement/announcement_page.dart';
import 'package:shiftend/pages/setting/announcement_list/announcement_list_state.dart';

class AnnouncementListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final announcements =
        context.select<AnnouncementListState, List<Announcement>>(
            (state) => state.announcements);
    return Scaffold(
      appBar: AppBar(
        title: const Text('お知らせ'),
      ),
      body: ListView.builder(
          itemCount: announcements.length,
          itemBuilder: (BuildContext _, int index) {
            return ListTile(
              title: Text(announcements[index].title),
              subtitle: Text(
                announcements[index].content,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: announcements[index].imageUrl != ''
                  ? SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.network(
                        announcements[index].imageUrl,
                        fit: BoxFit.cover,
                      ))
                  : const SizedBox(
                      width: 80,
                      height: 80,
                    ),
              onTap: () {
                Navigator.push<AnnouncementPage>(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AnnouncementPage(
                              announcement: announcements[index],
                            )));
              },
            );
          }),
    );
  }
}

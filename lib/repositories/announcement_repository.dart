import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shiftend/models/announcement/announcement.dart';
import 'package:shiftend/repositories/interfaces/announcement_repository_interface.dart';

class AnnouncementRepository extends AnnouncementRepositoryInterface {
  AnnouncementRepository({@required this.firestore});

  final FirebaseFirestore firestore;

  @override
  List<Announcement> getAnnouncements() {
    final announcements = <Announcement>[];
    firestore
        .collection('announcement')
        .get()
        .then((announcement) => {
              announcement.docs.map(
                (e) {
                  announcements.add(Announcement.fromJson(e.data()));
                },
              )
            })
        .catchError((dynamic error) {
      debugPrint(error.toString());
    });
    return announcements;
  }
}

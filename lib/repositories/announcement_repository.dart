import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shiftend/models/announcement/announcement.dart';
import 'package:shiftend/repositories/interfaces/announcement_repository_interface.dart';

class AnnouncementRepository extends AnnouncementRepositoryInterface {
  AnnouncementRepository({@required this.firestore});

  final FirebaseFirestore firestore;

  @override
  Future<List<Announcement>> getAnnouncements() async {
    final announcements = <Announcement>[];
    final res = await firestore
        .collection('announcement')
        .orderBy('created_at', descending: true)
        .get();
    res.docs.forEach((announcement) {
      announcements.add(Announcement.fromJson(announcement.data()));
    });
    return announcements;
  }
}

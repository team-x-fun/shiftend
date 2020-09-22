import 'package:shiftend/models/announcement/announcement.dart';

abstract class AnnouncementRepositoryInterface {
  Future<List<Announcement>> getAnnouncements();
}

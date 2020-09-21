import 'package:shiftend/models/announcement/announcement.dart';

abstract class AnnouncementRepositoryInterface {
  List<Announcement> getAnnouncements();
}

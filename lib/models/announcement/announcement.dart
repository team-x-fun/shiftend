import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement.freezed.dart';
part 'announcement.g.dart';

@freezed
abstract class Announcement with _$Announcement {
  const factory Announcement({
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'content') String content,
    @JsonKey(name: 'image_url') String imageUrl,
    @JsonKey(name: 'created_at') DateTime createdAt,
  }) = _Announcement;

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);
}

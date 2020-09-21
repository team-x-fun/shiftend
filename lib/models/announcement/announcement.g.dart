// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Announcement _$_$_AnnouncementFromJson(Map<String, dynamic> json) {
  return _$_Announcement(
    title: json['title'] as String,
    content: json['content'] as String,
    imageUrl: json['image_url'] as String,
  );
}

Map<String, dynamic> _$_$_AnnouncementToJson(_$_Announcement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.imageUrl,
    };

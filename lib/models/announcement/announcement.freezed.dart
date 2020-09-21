// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'announcement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return _Announcement.fromJson(json);
}

class _$AnnouncementTearOff {
  const _$AnnouncementTearOff();

  _Announcement call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'image_url') String imageUrl}) {
    return _Announcement(
      title: title,
      content: content,
      imageUrl: imageUrl,
    );
  }
}

// ignore: unused_element
const $Announcement = _$AnnouncementTearOff();

mixin _$Announcement {
  @JsonKey(name: 'title')
  String get title;
  @JsonKey(name: 'content')
  String get content;
  @JsonKey(name: 'image_url')
  String get imageUrl;

  Map<String, dynamic> toJson();
  $AnnouncementCopyWith<Announcement> get copyWith;
}

abstract class $AnnouncementCopyWith<$Res> {
  factory $AnnouncementCopyWith(
          Announcement value, $Res Function(Announcement) then) =
      _$AnnouncementCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'image_url') String imageUrl});
}

class _$AnnouncementCopyWithImpl<$Res> implements $AnnouncementCopyWith<$Res> {
  _$AnnouncementCopyWithImpl(this._value, this._then);

  final Announcement _value;
  // ignore: unused_field
  final $Res Function(Announcement) _then;

  @override
  $Res call({
    Object title = freezed,
    Object content = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      content: content == freezed ? _value.content : content as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }
}

abstract class _$AnnouncementCopyWith<$Res>
    implements $AnnouncementCopyWith<$Res> {
  factory _$AnnouncementCopyWith(
          _Announcement value, $Res Function(_Announcement) then) =
      __$AnnouncementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'image_url') String imageUrl});
}

class __$AnnouncementCopyWithImpl<$Res> extends _$AnnouncementCopyWithImpl<$Res>
    implements _$AnnouncementCopyWith<$Res> {
  __$AnnouncementCopyWithImpl(
      _Announcement _value, $Res Function(_Announcement) _then)
      : super(_value, (v) => _then(v as _Announcement));

  @override
  _Announcement get _value => super._value as _Announcement;

  @override
  $Res call({
    Object title = freezed,
    Object content = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_Announcement(
      title: title == freezed ? _value.title : title as String,
      content: content == freezed ? _value.content : content as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }
}

@JsonSerializable()
class _$_Announcement implements _Announcement {
  const _$_Announcement(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'image_url') this.imageUrl});

  factory _$_Announcement.fromJson(Map<String, dynamic> json) =>
      _$_$_AnnouncementFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString() {
    return 'Announcement(title: $title, content: $content, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Announcement &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(imageUrl);

  @override
  _$AnnouncementCopyWith<_Announcement> get copyWith =>
      __$AnnouncementCopyWithImpl<_Announcement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AnnouncementToJson(this);
  }
}

abstract class _Announcement implements Announcement {
  const factory _Announcement(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'image_url') String imageUrl}) = _$_Announcement;

  factory _Announcement.fromJson(Map<String, dynamic> json) =
      _$_Announcement.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  _$AnnouncementCopyWith<_Announcement> get copyWith;
}

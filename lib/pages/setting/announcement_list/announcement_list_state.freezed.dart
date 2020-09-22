// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'announcement_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AnnouncementListStateTearOff {
  const _$AnnouncementListStateTearOff();

  _AnnouncementListState call(
      {NotifierState notifierState = NotifierState.initial,
      List<Announcement> announcements = const <Announcement>[]}) {
    return _AnnouncementListState(
      notifierState: notifierState,
      announcements: announcements,
    );
  }
}

// ignore: unused_element
const $AnnouncementListState = _$AnnouncementListStateTearOff();

mixin _$AnnouncementListState {
  NotifierState get notifierState;
  List<Announcement> get announcements;

  $AnnouncementListStateCopyWith<AnnouncementListState> get copyWith;
}

abstract class $AnnouncementListStateCopyWith<$Res> {
  factory $AnnouncementListStateCopyWith(AnnouncementListState value,
          $Res Function(AnnouncementListState) then) =
      _$AnnouncementListStateCopyWithImpl<$Res>;
  $Res call({NotifierState notifierState, List<Announcement> announcements});
}

class _$AnnouncementListStateCopyWithImpl<$Res>
    implements $AnnouncementListStateCopyWith<$Res> {
  _$AnnouncementListStateCopyWithImpl(this._value, this._then);

  final AnnouncementListState _value;
  // ignore: unused_field
  final $Res Function(AnnouncementListState) _then;

  @override
  $Res call({
    Object notifierState = freezed,
    Object announcements = freezed,
  }) {
    return _then(_value.copyWith(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      announcements: announcements == freezed
          ? _value.announcements
          : announcements as List<Announcement>,
    ));
  }
}

abstract class _$AnnouncementListStateCopyWith<$Res>
    implements $AnnouncementListStateCopyWith<$Res> {
  factory _$AnnouncementListStateCopyWith(_AnnouncementListState value,
          $Res Function(_AnnouncementListState) then) =
      __$AnnouncementListStateCopyWithImpl<$Res>;
  @override
  $Res call({NotifierState notifierState, List<Announcement> announcements});
}

class __$AnnouncementListStateCopyWithImpl<$Res>
    extends _$AnnouncementListStateCopyWithImpl<$Res>
    implements _$AnnouncementListStateCopyWith<$Res> {
  __$AnnouncementListStateCopyWithImpl(_AnnouncementListState _value,
      $Res Function(_AnnouncementListState) _then)
      : super(_value, (v) => _then(v as _AnnouncementListState));

  @override
  _AnnouncementListState get _value => super._value as _AnnouncementListState;

  @override
  $Res call({
    Object notifierState = freezed,
    Object announcements = freezed,
  }) {
    return _then(_AnnouncementListState(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      announcements: announcements == freezed
          ? _value.announcements
          : announcements as List<Announcement>,
    ));
  }
}

class _$_AnnouncementListState implements _AnnouncementListState {
  const _$_AnnouncementListState(
      {this.notifierState = NotifierState.initial,
      this.announcements = const <Announcement>[]})
      : assert(notifierState != null),
        assert(announcements != null);

  @JsonKey(defaultValue: NotifierState.initial)
  @override
  final NotifierState notifierState;
  @JsonKey(defaultValue: const <Announcement>[])
  @override
  final List<Announcement> announcements;

  @override
  String toString() {
    return 'AnnouncementListState(notifierState: $notifierState, announcements: $announcements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnnouncementListState &&
            (identical(other.notifierState, notifierState) ||
                const DeepCollectionEquality()
                    .equals(other.notifierState, notifierState)) &&
            (identical(other.announcements, announcements) ||
                const DeepCollectionEquality()
                    .equals(other.announcements, announcements)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notifierState) ^
      const DeepCollectionEquality().hash(announcements);

  @override
  _$AnnouncementListStateCopyWith<_AnnouncementListState> get copyWith =>
      __$AnnouncementListStateCopyWithImpl<_AnnouncementListState>(
          this, _$identity);
}

abstract class _AnnouncementListState implements AnnouncementListState {
  const factory _AnnouncementListState(
      {NotifierState notifierState,
      List<Announcement> announcements}) = _$_AnnouncementListState;

  @override
  NotifierState get notifierState;
  @override
  List<Announcement> get announcements;
  @override
  _$AnnouncementListStateCopyWith<_AnnouncementListState> get copyWith;
}

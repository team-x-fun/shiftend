// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'announcement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AnnouncementStateTearOff {
  const _$AnnouncementStateTearOff();

  _AnnouncementState call(
      {NotifierState notifierState = NotifierState.initial,
      List<Announcement> announcements = const <Announcement>[]}) {
    return _AnnouncementState(
      notifierState: notifierState,
      announcements: announcements,
    );
  }
}

// ignore: unused_element
const $AnnouncementState = _$AnnouncementStateTearOff();

mixin _$AnnouncementState {
  NotifierState get notifierState;
  List<Announcement> get announcements;

  $AnnouncementStateCopyWith<AnnouncementState> get copyWith;
}

abstract class $AnnouncementStateCopyWith<$Res> {
  factory $AnnouncementStateCopyWith(
          AnnouncementState value, $Res Function(AnnouncementState) then) =
      _$AnnouncementStateCopyWithImpl<$Res>;
  $Res call({NotifierState notifierState, List<Announcement> announcements});
}

class _$AnnouncementStateCopyWithImpl<$Res>
    implements $AnnouncementStateCopyWith<$Res> {
  _$AnnouncementStateCopyWithImpl(this._value, this._then);

  final AnnouncementState _value;
  // ignore: unused_field
  final $Res Function(AnnouncementState) _then;

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

abstract class _$AnnouncementStateCopyWith<$Res>
    implements $AnnouncementStateCopyWith<$Res> {
  factory _$AnnouncementStateCopyWith(
          _AnnouncementState value, $Res Function(_AnnouncementState) then) =
      __$AnnouncementStateCopyWithImpl<$Res>;
  @override
  $Res call({NotifierState notifierState, List<Announcement> announcements});
}

class __$AnnouncementStateCopyWithImpl<$Res>
    extends _$AnnouncementStateCopyWithImpl<$Res>
    implements _$AnnouncementStateCopyWith<$Res> {
  __$AnnouncementStateCopyWithImpl(
      _AnnouncementState _value, $Res Function(_AnnouncementState) _then)
      : super(_value, (v) => _then(v as _AnnouncementState));

  @override
  _AnnouncementState get _value => super._value as _AnnouncementState;

  @override
  $Res call({
    Object notifierState = freezed,
    Object announcements = freezed,
  }) {
    return _then(_AnnouncementState(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      announcements: announcements == freezed
          ? _value.announcements
          : announcements as List<Announcement>,
    ));
  }
}

class _$_AnnouncementState implements _AnnouncementState {
  const _$_AnnouncementState(
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
    return 'AnnouncementState(notifierState: $notifierState, announcements: $announcements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnnouncementState &&
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
  _$AnnouncementStateCopyWith<_AnnouncementState> get copyWith =>
      __$AnnouncementStateCopyWithImpl<_AnnouncementState>(this, _$identity);
}

abstract class _AnnouncementState implements AnnouncementState {
  const factory _AnnouncementState(
      {NotifierState notifierState,
      List<Announcement> announcements}) = _$_AnnouncementState;

  @override
  NotifierState get notifierState;
  @override
  List<Announcement> get announcements;
  @override
  _$AnnouncementStateCopyWith<_AnnouncementState> get copyWith;
}

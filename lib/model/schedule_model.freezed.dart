// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleStateData {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<ScheduleItemData> get scheduleItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleStateDataCopyWith<ScheduleStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateDataCopyWith<$Res> {
  factory $ScheduleStateDataCopyWith(
          ScheduleStateData value, $Res Function(ScheduleStateData) then) =
      _$ScheduleStateDataCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, bool isReadyData, List<ScheduleItemData> scheduleItems});
}

/// @nodoc
class _$ScheduleStateDataCopyWithImpl<$Res>
    implements $ScheduleStateDataCopyWith<$Res> {
  _$ScheduleStateDataCopyWithImpl(this._value, this._then);

  final ScheduleStateData _value;
  // ignore: unused_field
  final $Res Function(ScheduleStateData) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? scheduleItems = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduleItems: scheduleItems == freezed
          ? _value.scheduleItems
          : scheduleItems // ignore: cast_nullable_to_non_nullable
              as List<ScheduleItemData>,
    ));
  }
}

/// @nodoc
abstract class _$$_ScheduleStateDataCopyWith<$Res>
    implements $ScheduleStateDataCopyWith<$Res> {
  factory _$$_ScheduleStateDataCopyWith(_$_ScheduleStateData value,
          $Res Function(_$_ScheduleStateData) then) =
      __$$_ScheduleStateDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, bool isReadyData, List<ScheduleItemData> scheduleItems});
}

/// @nodoc
class __$$_ScheduleStateDataCopyWithImpl<$Res>
    extends _$ScheduleStateDataCopyWithImpl<$Res>
    implements _$$_ScheduleStateDataCopyWith<$Res> {
  __$$_ScheduleStateDataCopyWithImpl(
      _$_ScheduleStateData _value, $Res Function(_$_ScheduleStateData) _then)
      : super(_value, (v) => _then(v as _$_ScheduleStateData));

  @override
  _$_ScheduleStateData get _value => super._value as _$_ScheduleStateData;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? scheduleItems = freezed,
  }) {
    return _then(_$_ScheduleStateData(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduleItems: scheduleItems == freezed
          ? _value._scheduleItems
          : scheduleItems // ignore: cast_nullable_to_non_nullable
              as List<ScheduleItemData>,
    ));
  }
}

/// @nodoc

class _$_ScheduleStateData implements _ScheduleStateData {
  _$_ScheduleStateData(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<ScheduleItemData> scheduleItems = const []})
      : _scheduleItems = scheduleItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<ScheduleItemData> _scheduleItems;
  @override
  @JsonKey()
  List<ScheduleItemData> get scheduleItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleItems);
  }

  @override
  String toString() {
    return 'ScheduleStateData(isLoading: $isLoading, isReadyData: $isReadyData, scheduleItems: $scheduleItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleStateData &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._scheduleItems, _scheduleItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_scheduleItems));

  @JsonKey(ignore: true)
  @override
  _$$_ScheduleStateDataCopyWith<_$_ScheduleStateData> get copyWith =>
      __$$_ScheduleStateDataCopyWithImpl<_$_ScheduleStateData>(
          this, _$identity);
}

abstract class _ScheduleStateData implements ScheduleStateData {
  factory _ScheduleStateData(
      {final bool isLoading,
      final bool isReadyData,
      final List<ScheduleItemData> scheduleItems}) = _$_ScheduleStateData;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isReadyData => throw _privateConstructorUsedError;
  @override
  List<ScheduleItemData> get scheduleItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleStateDataCopyWith<_$_ScheduleStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TempScheduleItemData {
  String get title => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  bool get allDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempScheduleItemDataCopyWith<TempScheduleItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempScheduleItemDataCopyWith<$Res> {
  factory $TempScheduleItemDataCopyWith(TempScheduleItemData value,
          $Res Function(TempScheduleItemData) then) =
      _$TempScheduleItemDataCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String comment,
      DateTime startDate,
      DateTime endDate,
      bool allDay});
}

/// @nodoc
class _$TempScheduleItemDataCopyWithImpl<$Res>
    implements $TempScheduleItemDataCopyWith<$Res> {
  _$TempScheduleItemDataCopyWithImpl(this._value, this._then);

  final TempScheduleItemData _value;
  // ignore: unused_field
  final $Res Function(TempScheduleItemData) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? comment = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? allDay = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allDay: allDay == freezed
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TempScheduleItemDataCopyWith<$Res>
    implements $TempScheduleItemDataCopyWith<$Res> {
  factory _$$_TempScheduleItemDataCopyWith(_$_TempScheduleItemData value,
          $Res Function(_$_TempScheduleItemData) then) =
      __$$_TempScheduleItemDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String comment,
      DateTime startDate,
      DateTime endDate,
      bool allDay});
}

/// @nodoc
class __$$_TempScheduleItemDataCopyWithImpl<$Res>
    extends _$TempScheduleItemDataCopyWithImpl<$Res>
    implements _$$_TempScheduleItemDataCopyWith<$Res> {
  __$$_TempScheduleItemDataCopyWithImpl(_$_TempScheduleItemData _value,
      $Res Function(_$_TempScheduleItemData) _then)
      : super(_value, (v) => _then(v as _$_TempScheduleItemData));

  @override
  _$_TempScheduleItemData get _value => super._value as _$_TempScheduleItemData;

  @override
  $Res call({
    Object? title = freezed,
    Object? comment = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? allDay = freezed,
  }) {
    return _then(_$_TempScheduleItemData(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      allDay: allDay == freezed
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TempScheduleItemData implements _TempScheduleItemData {
  _$_TempScheduleItemData(
      {this.title = '',
      this.comment = '',
      required this.startDate,
      required this.endDate,
      this.allDay = false});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String comment;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  @JsonKey()
  final bool allDay;

  @override
  String toString() {
    return 'TempScheduleItemData(title: $title, comment: $comment, startDate: $startDate, endDate: $endDate, allDay: $allDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempScheduleItemData &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.allDay, allDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(allDay));

  @JsonKey(ignore: true)
  @override
  _$$_TempScheduleItemDataCopyWith<_$_TempScheduleItemData> get copyWith =>
      __$$_TempScheduleItemDataCopyWithImpl<_$_TempScheduleItemData>(
          this, _$identity);
}

abstract class _TempScheduleItemData implements TempScheduleItemData {
  factory _TempScheduleItemData(
      {final String title,
      final String comment,
      required final DateTime startDate,
      required final DateTime endDate,
      final bool allDay}) = _$_TempScheduleItemData;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get comment => throw _privateConstructorUsedError;
  @override
  DateTime get startDate => throw _privateConstructorUsedError;
  @override
  DateTime get endDate => throw _privateConstructorUsedError;
  @override
  bool get allDay => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TempScheduleItemDataCopyWith<_$_TempScheduleItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

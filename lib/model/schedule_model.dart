import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calendar_app/service/schedule_db.dart';

part 'schedule_model.freezed.dart';

@freezed
abstract class ScheduleStateData with _$ScheduleStateData {
  factory ScheduleStateData({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default([]) List<ScheduleItemData> scheduleItems,
  }) = _ScheduleStateData;
}

@freezed
abstract class TempScheduleItemData with _$TempScheduleItemData {
  factory TempScheduleItemData({
    @Default('') String title,
    @Default('') String comment,
    required DateTime startDate,
    required DateTime endDate,
    @Default(false) bool allDay,
  }) = _TempScheduleItemData;
}

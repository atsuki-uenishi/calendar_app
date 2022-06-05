import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/service/schedule_db.dart';

final DateTime now = DateTime.now();
final selectedScheduleState = StateProvider<ScheduleItemData>(
  (ref) => ScheduleItemData(
      id: 9999,
      startDate: now,
      endDate: now,
      title: '',
      comment: '',
      allDay: false),
);

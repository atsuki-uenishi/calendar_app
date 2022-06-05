import 'schedule_model.dart';
import 'package:calendar_app/service/schedule_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

class ScheduleDatabaseNotifier extends StateNotifier<ScheduleStateData> {
  ScheduleDatabaseNotifier() : super(ScheduleStateData());

  final _db = MyDatabase();

  readData() async {
    state = state.copyWith(isLoading: true);

    final List<ScheduleItemData> scheduleItems =
        await _db.readAllScheduleData();

    state = state.copyWith(
      isLoading: false,
      isReadyData: true,
      scheduleItems: scheduleItems,
    );
  }

  writeData(TempScheduleItemData data) async {
    ScheduleItemCompanion entry = ScheduleItemCompanion(
        title: Value(data.title),
        comment: Value(data.comment),
        startDate: Value(data.startDate),
        endDate: Value(data.endDate),
        allDay: Value(data.allDay));

    state = state.copyWith(isLoading: true);
    await _db.writeSchedule(entry);
    readData();
  }

  deleteData(ScheduleItemData data) async {
    state = state.copyWith(isLoading: true);
    await _db.deleteSchedule(data.id);
    readData();
  }

  updateData(TempScheduleItemData data, int id) async {
    if (data.title.isEmpty) {
      return;
    }
    ScheduleItemCompanion entry = ScheduleItemCompanion(
        title: Value(data.title),
        comment: Value(data.comment),
        startDate: Value(data.startDate),
        endDate: Value(data.endDate),
        allDay: Value(data.allDay));
    state = state.copyWith(isLoading: true);
    await _db.updateSchedule(entry, id);
    readData();
  }

  Future<List<ScheduleItemData>> makeSelectedDayList(DateTime date) async {
    List<ScheduleItemData> list = [];
    List<ScheduleItemData> datas = await _db.readAllScheduleData();
    final selectedDate = DateTime(date.year, date.month, date.day);
    for (ScheduleItemData data in datas) {
      final startDate = DateTime(
          data.startDate.year, data.startDate.month, data.startDate.day);
      final endDate =
          DateTime(data.endDate.year, data.endDate.month, data.endDate.day);

      if (startDate != endDate) {
        if (date.isAfter(data.startDate) && date.isBefore(data.endDate)) {
          list.add(data);
        } else if (startDate == selectedDate || endDate == selectedDate) {
          list.add(data);
        }
      } else {
        if (startDate == selectedDate || endDate == selectedDate) {
          list.add(data);
        }
      }
    }
    return list;
  }
}

final scheduleDatabaseProvider = StateNotifierProvider((_) {
  ScheduleDatabaseNotifier notify = ScheduleDatabaseNotifier();
  notify.readData();

  return notify;
});

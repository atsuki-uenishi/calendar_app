import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/model/selected_day_state.dart';

DateTime now = DateTime.now();
final startDateState = StateProvider<DateTime>((ref) {
  final _selectedDay = ref.watch(selectedDayState);
  return DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day,
      now.hour, now.minute);
});

import 'dart:collection';

import 'package:calendar_app/common/calendar_text_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:calendar_app/model/selected_day_state.dart';
import 'package:calendar_app/constants/text_constants.dart';
import 'package:calendar_app/constants/date_format_constants.dart';
import 'package:calendar_app/view/schedules_list_view.dart';
import 'package:calendar_app/model/schedule_database_provider.dart';

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);

  DateTime now = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDayProvider = ref.watch(selectedDayState.notifier);
    final _selectedDay = ref.watch(selectedDayState);

    final scheduleItemsState = ref.watch(scheduleDatabaseProvider);
    final scheduleItemsProvider = ref.watch(scheduleDatabaseProvider.notifier);

    Map<DateTime, List<String>> _eventsList = {};
    for (var item in scheduleItemsProvider.state.scheduleItems) {
      if (item.startDate == item.endDate) {
        _eventsList[item.startDate] = [item.title];
      } else {
        _eventsList[item.startDate] = [item.title];
        _eventsList[item.endDate] = [item.title];
        int difference = DateTime(
                item.endDate.year, item.endDate.month, item.endDate.day)
            .difference(DateTime(
                item.startDate.year, item.startDate.month, item.startDate.day))
            .inDays;
        for (int i = 1; i <= difference; i++) {
          _eventsList[item.startDate.add(Duration(days: i))] = [item.title];
        }
      }
    }

    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.tittleText),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(
              eventLoader: getEventForDay,
              focusedDay: _selectedDay,
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              calendarFormat: _calendarFormat,
              locale: Localizations.localeOf(context).languageCode,
              headerStyle: HeaderStyle(
                titleTextFormatter: (date, dynamic) {
                  return DateFormatConstants.monthPickerFormat.format(date);
                },
                titleTextStyle: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
                leftChevronPadding:
                    const EdgeInsets.only(left: 5.0, right: 50.0),
                leftChevronIcon: OutlinedButton(
                  child: const Text(TextConstants.todayText),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: const BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  onPressed: () {
                    selectedDayProvider.update((state) => now);
                  },
                ),
                formatButtonVisible: false,
                rightChevronVisible: false,
              ),
              onHeaderTapped: (_) {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  currentTime: now,
                  locale: LocaleType.jp,
                  onConfirm: (date) {
                    selectedDayProvider.update((state) => date);
                  },
                );
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, day) {
                selectedDayProvider.update((state) => selectedDay);
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return SchedulesListView();
                    });
              },
              daysOfWeekHeight: 32.0,
              calendarBuilders: CalendarBuilders(
                defaultBuilder:
                    (BuildContext context, DateTime day, DateTime focusedDay) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        color: CalendarTextColor.textColor(day),
                      ),
                    ),
                  );
                },
                dowBuilder: (BuildContext context, DateTime day) {
                  final locale = Localizations.localeOf(context).languageCode;
                  final dowText = const DaysOfWeekStyle()
                          .dowTextFormatter
                          ?.call(day, locale) ??
                      DateFormat.E(locale).format(day);
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    child: Center(
                      child: Text(
                        dowText,
                        style: TextStyle(
                          color: CalendarTextColor.textColor(day),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:calendar_app/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:calendar_app/constants/text_constants.dart';
import 'package:calendar_app/model/all_day_state.dart';
import 'package:calendar_app/model/selected_day_state.dart';
import 'package:calendar_app/model/start_date_state.dart';
import 'package:calendar_app/model/end_date_state.dart';
import 'package:calendar_app/constants/date_format_constants.dart';
import 'package:calendar_app/model/schedule_model.dart';
import 'package:calendar_app/model/is_disabeld_state.dart';
import 'package:calendar_app/model/schedule_database_provider.dart';

class ScheduleAddView extends ConsumerWidget {
  ScheduleAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedDay = ref.watch(selectedDayState);
    final _startDateProvider = ref.watch(startDateState.notifier);
    final _endDateProvider = ref.watch(endDateState.notifier);
    final _isDisabledProvider = ref.watch(isDisabledState.notifier);
    final _allDayNotifier = ref.watch(allDayProvider.notifier);
    final scheduleProvider = ref.watch(scheduleDatabaseProvider.notifier);
    final _defaultDate = ref.read(startDateState);

    TempScheduleItemData temp =
        TempScheduleItemData(startDate: _defaultDate, endDate: _defaultDate);

    void isDisabled() {
      if (temp.title == '' || temp.comment == '') {
        _isDisabledProvider.update((state) => false);
        return;
      }
      _isDisabledProvider.update((state) => true);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(TextConstants.addScheduleText),
        automaticallyImplyLeading: false,
        leading: TextButton(
          child: const Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            if (temp !=
                TempScheduleItemData(
                    startDate: _defaultDate, endDate: _defaultDate)) {
              showCupertinoModalPopup(
                  context: context,
                  builder: (_) {
                    return CupertinoActionSheet(
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {
                            _isDisabledProvider.update((state) => false);
                            _allDayNotifier.update((state) => false);
                            Navigator.pushNamed(
                                context, RouteGenerator.homeView);
                          },
                          child: const Text(TextConstants.editDiscardText),
                        ),
                      ],
                      cancelButton: CupertinoButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(TextConstants.cancelText),
                      ),
                    );
                  });
              return;
            }
            _isDisabledProvider.update((state) => false);
            _allDayNotifier.update((state) => false);
            Navigator.pop(context);
          },
        ),
        actions: [
          Consumer(
            builder: (context, ref, _) {
              final _isDisabledState = ref.watch(isDisabledState);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _isDisabledState
                      ? () {
                          scheduleProvider.writeData(temp);
                          Navigator.pushNamed(context, RouteGenerator.homeView);
                        }
                      : null,
                  child: const Text(
                    TextConstants.saveText,
                    style: TextStyle(color: Colors.black87),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: TextField(
                  style: const TextStyle(fontSize: 20.0),
                  decoration: InputDecoration(
                    hintText: TextConstants.pleaseTitleText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    temp = temp.copyWith(title: value);
                    isDisabled();
                  },
                  onSubmitted: (value) {
                    temp = temp.copyWith(title: value);
                    isDisabled();
                  },
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Consumer(
              builder: (context, ref, _) {
                final allDayState = ref.watch(allDayProvider);
                final _startDate = ref.watch(startDateState);
                final _endDate = ref.watch(endDateState);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: SwitchListTile(
                          title: const Text(TextConstants.allDayText),
                          tileColor: Colors.white,
                          value: allDayState,
                          onChanged: (bool value) {
                            _allDayNotifier.update((state) => value);
                            temp = temp.copyWith(allDay: value);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: ListTile(
                        leading: const Text(TextConstants.startText),
                        trailing: TextButton(
                          child: Text(
                            allDayState
                                ? DateFormatConstants
                                    .scheduleDateTimeTileAllDayOnFormat
                                    .format(_startDate)
                                : DateFormatConstants
                                    .scheduleDateTimeTileAllDayOffFormat
                                    .format(_startDate),
                            style: const TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {
                            allDayState
                                ? DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    maxTime: _endDate,
                                    currentTime: _startDate,
                                    locale: LocaleType.jp,
                                    onChanged: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(startDate: date);
                                    },
                                    onConfirm: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(startDate: date);
                                    },
                                  )
                                : DatePicker.showDateTimePicker(
                                    context,
                                    showTitleActions: true,
                                    maxTime: _endDate,
                                    currentTime: _startDate,
                                    locale: LocaleType.jp,
                                    onChanged: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(startDate: date);
                                    },
                                    onConfirm: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(startDate: date);
                                    },
                                  );
                          },
                        ),
                        tileColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: ListTile(
                        leading: const Text(TextConstants.endText),
                        trailing: TextButton(
                          child: Text(
                            allDayState
                                ? DateFormatConstants
                                    .scheduleDateTimeTileAllDayOnFormat
                                    .format(_endDate)
                                : DateFormatConstants
                                    .scheduleDateTimeTileAllDayOffFormat
                                    .format(_endDate),
                            style: const TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {
                            temp.allDay
                                ? DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    minTime: _startDate,
                                    currentTime: _endDate,
                                    locale: LocaleType.jp,
                                    onChanged: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(endDate: date);
                                    },
                                    onConfirm: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(endDate: date);
                                    },
                                  )
                                : DatePicker.showDateTimePicker(
                                    context,
                                    minTime: _startDate,
                                    showTitleActions: true,
                                    currentTime: _endDate,
                                    locale: LocaleType.jp,
                                    onChanged: (date) {
                                      _endDateProvider.update((state) => date);
                                      temp = temp.copyWith(endDate: date);
                                    },
                                    onConfirm: (date) {
                                      _endDateProvider.update((state) => date);
                                      temp = temp.copyWith(endDate: date);
                                    },
                                  );
                          },
                        ),
                        tileColor: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: TextConstants.pleaseCommentText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    temp = temp.copyWith(comment: value);
                    isDisabled();
                  },
                  onSubmitted: (value) {
                    temp = temp.copyWith(comment: value);
                    isDisabled();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

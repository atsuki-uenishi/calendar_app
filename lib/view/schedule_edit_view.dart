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
import 'package:calendar_app/model/selected_schedule_provider.dart';
import 'package:calendar_app/service/schedule_db.dart';

class ScheduleEditView extends ConsumerWidget {
  ScheduleEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedDay = ref.read(selectedDayState);
    final _startDateProvider = ref.watch(startDateState.notifier);
    final _endDateProvider = ref.watch(endDateState.notifier);
    final _isDisabledProvider = ref.watch(isDisabledState.notifier);
    final _allDayNotifier = ref.watch(allDayProvider.notifier);
    final scheduleProvider = ref.watch(scheduleDatabaseProvider.notifier);
    final selectedScheduleProvider = ref.read(selectedScheduleState);

    ScheduleItemData scheduleItem = selectedScheduleProvider;

    TempScheduleItemData itemComparison = TempScheduleItemData(
        title: scheduleItem.title,
        comment: scheduleItem.comment,
        allDay: scheduleItem.allDay,
        startDate: scheduleItem.startDate,
        endDate: scheduleItem.endDate);

    TempScheduleItemData temp = TempScheduleItemData(
        title: scheduleItem.title,
        comment: scheduleItem.comment,
        allDay: scheduleItem.allDay,
        startDate: scheduleItem.startDate,
        endDate: scheduleItem.endDate);

    void isDisabled() {
      if (temp == itemComparison) {
        _isDisabledProvider.update((state) => false);
        return;
      }
      _isDisabledProvider.update((state) => true);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(TextConstants.editScheduleText),
        automaticallyImplyLeading: false,
        leading: TextButton(
          child: const Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            if (temp != itemComparison) {
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
                          scheduleProvider.updateData(temp, scheduleItem.id);
                          _isDisabledProvider.update((state) => false);
                          _allDayNotifier.update((state) => false);
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
                  controller: TextEditingController(text: temp.title),
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
                final _allDayState = ref.watch(allDayProvider);
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
                          value: temp.allDay,
                          onChanged: (bool value) {
                            temp.allDay
                                ? _allDayNotifier.update((state) => true)
                                : null;
                            _allDayNotifier.update((state) => value);
                            temp = temp.copyWith(allDay: value);
                            isDisabled();
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: ListTile(
                        leading: const Text(TextConstants.startText),
                        trailing: TextButton(
                          child: Text(
                            temp.allDay
                                ? DateFormatConstants
                                    .scheduleDateTimeTileAllDayOnFormat
                                    .format(temp.startDate)
                                : DateFormatConstants
                                    .scheduleDateTimeTileAllDayOffFormat
                                    .format(temp.startDate),
                            style: const TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {
                            temp.allDay
                                ? DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    maxTime: temp.endDate,
                                    currentTime: temp.startDate,
                                    locale: LocaleType.jp,
                                    onChanged: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(startDate: date);
                                      isDisabled();
                                    },
                                    onConfirm: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(startDate: date);
                                      isDisabled();
                                    },
                                  )
                                : DatePicker.showDateTimePicker(
                                    context,
                                    showTitleActions: true,
                                    maxTime: temp.endDate,
                                    currentTime: temp.startDate,
                                    locale: LocaleType.jp,
                                    onChanged: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(startDate: date);
                                      isDisabled();
                                    },
                                    onConfirm: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(startDate: date);
                                      isDisabled();
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
                            temp.allDay
                                ? DateFormatConstants
                                    .scheduleDateTimeTileAllDayOnFormat
                                    .format(temp.endDate)
                                : DateFormatConstants
                                    .scheduleDateTimeTileAllDayOffFormat
                                    .format(temp.endDate),
                            style: const TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {
                            temp.allDay
                                ? DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    minTime: temp.startDate,
                                    currentTime: temp.endDate,
                                    locale: LocaleType.jp,
                                    onChanged: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(endDate: date);
                                      isDisabled();
                                    },
                                    onConfirm: (date) {
                                      _startDateProvider
                                          .update((state) => date);
                                      temp = temp.copyWith(endDate: date);
                                      isDisabled();
                                    },
                                  )
                                : DatePicker.showDateTimePicker(
                                    context,
                                    minTime: temp.startDate,
                                    showTitleActions: true,
                                    currentTime: temp.endDate,
                                    locale: LocaleType.jp,
                                    onChanged: (date) {
                                      _endDateProvider.update((state) => date);
                                      temp = temp.copyWith(endDate: date);
                                      isDisabled();
                                    },
                                    onConfirm: (date) {
                                      _endDateProvider.update((state) => date);
                                      temp = temp.copyWith(endDate: date);
                                      isDisabled();
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
                  controller: TextEditingController(text: scheduleItem.comment),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlinedButton(
                child: const Text(
                  TextConstants.deleteThisScheduleText,
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50.0),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            width: 300.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    TextConstants.deleteScheduleText,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Text(
                                  TextConstants.deleteQuestionText,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 150.0,
                                        height: 50.0,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Colors.black12,
                                            ),
                                            right: BorderSide(
                                              color: Colors.black12,
                                            ),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            TextConstants.cancelText,
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        scheduleProvider
                                            .deleteData(scheduleItem);
                                        _isDisabledProvider
                                            .update((state) => false);
                                        _allDayNotifier
                                            .update((state) => false);
                                        Navigator.pushNamed(
                                            context, RouteGenerator.homeView);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 150.0,
                                        height: 50.0,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Colors.black12,
                                            ),
                                            right: BorderSide(
                                              color: Colors.black12,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          TextConstants.deleteText,
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

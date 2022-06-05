import 'package:calendar_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:calendar_app/model/selected_day_state.dart';
import 'package:calendar_app/constants/date_format_constants.dart';
import 'package:calendar_app/common/calendar_text_color.dart';
import 'package:calendar_app/constants/text_constants.dart';
import 'package:calendar_app/repository/schedule_database_provider.dart';
import 'package:calendar_app/service/schedule_db.dart';
import 'package:calendar_app/model/selected_schedule_provider.dart';

class SchedulesListView extends ConsumerWidget {
  SchedulesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedDayProvider = ref.watch(selectedDayState.notifier);
    final _selectedDay = ref.watch(selectedDayState);

    final _selectedScheduleProvider = ref.watch(selectedScheduleState.notifier);

    final _selectedDayFormat =
        DateFormatConstants.schedulesListFormat.format(_selectedDay);
    final _daysOfWeek =
        DateFormatConstants.dateFormatForDayOfWeek.format(_selectedDay);

    final _scheduleProvider = ref.watch(scheduleDatabaseProvider.notifier);

    Future<List<ScheduleItemData>> getScheduleItemList() async {
      return await _scheduleProvider.makeSelectedDayList(_selectedDay);
    }

    void pushedScheduleAddView() {
      Navigator.pushNamed(context, RouteGenerator.scheduleAddView);
    }

    void pushedScheduleEditView(ScheduleItemData item) {
      Navigator.pushNamed(
        context,
        RouteGenerator.scheduleEditView,
      );
    }

    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.only(top: 150.0, bottom: 30.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        content: Navigator(
          onGenerateRoute: (_) {
            return MaterialPageRoute(
                builder: (context) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onHorizontalDragEnd: (details) {
                        Future stayNavigator() async {
                          await Future.delayed(
                              const Duration(milliseconds: 100));
                          return Navigator.pushNamed(
                              context, RouteGenerator.schedulesListView);
                        }

                        if (details.primaryVelocity! < 0) {
                          _selectedDayProvider.update(
                              (state) => state.add(const Duration(days: 1)));
                          stayNavigator();
                        }
                        if (details.primaryVelocity! > 0) {
                          _selectedDayProvider.update((state) =>
                              state.subtract(const Duration(days: 1)));
                          stayNavigator();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 0.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(text: _selectedDayFormat),
                                    TextSpan(
                                      text: '  ($_daysOfWeek)',
                                      style: TextStyle(
                                        color: CalendarTextColor.textColor(
                                            _selectedDay),
                                      ),
                                    ),
                                  ]),
                                  //'$selectedDayFormat ($daysOfWeek)',
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    child: const Icon(Icons.add),
                                    onPressed: () {
                                      pushedScheduleAddView();
                                    })
                              ],
                            ),
                            FutureBuilder(
                                future: getScheduleItemList(),
                                builder: (context,
                                    AsyncSnapshot<List<ScheduleItemData>>
                                        snapshot) {
                                  final scheduleList = snapshot.data;
                                  if (snapshot.connectionState !=
                                      ConnectionState.done) {
                                    return CircularProgressIndicator();
                                  }
                                  if (scheduleList?.length == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 300.0,
                                        height: 400.0,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          top: BorderSide(
                                            color: Color(0xFFBDBDBD),
                                          ),
                                        )),
                                        child:
                                            Text(TextConstants.noScheduleText),
                                      ),
                                    );
                                  }
                                  return Column(
                                    children: [
                                      for (ScheduleItemData item
                                          in scheduleList!)
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              _selectedScheduleProvider
                                                  .update((state) => item);
                                              pushedScheduleEditView(item);
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                top: BorderSide(
                                                  color: Color(0xFFBDBDBD),
                                                ),
                                              )),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 10.0),
                                                      child: item.allDay ||
                                                              (DateTime(
                                                                          _selectedDay
                                                                              .year,
                                                                          _selectedDay
                                                                              .month,
                                                                          _selectedDay
                                                                              .day) !=
                                                                      DateTime(
                                                                          item.startDate
                                                                              .year,
                                                                          item.startDate
                                                                              .month,
                                                                          item.startDate
                                                                              .day) &&
                                                                  DateTime(
                                                                          _selectedDay
                                                                              .year,
                                                                          _selectedDay
                                                                              .month,
                                                                          _selectedDay
                                                                              .day) !=
                                                                      DateTime(
                                                                          item.endDate
                                                                              .year,
                                                                          item.endDate
                                                                              .month,
                                                                          item.endDate
                                                                              .day))
                                                          ? Text(TextConstants
                                                              .allDayText)
                                                          : Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  DateTime(item.startDate.year, item.startDate.month, item.startDate.day) ==
                                                                          DateTime(
                                                                              _selectedDay
                                                                                  .year,
                                                                              _selectedDay
                                                                                  .month,
                                                                              _selectedDay
                                                                                  .day)
                                                                      ? DateFormatConstants
                                                                          .timeFormat
                                                                          .format(
                                                                              item.startDate)
                                                                      : '〜',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14.0),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Text(
                                                                  DateTime(item.endDate.year, item.endDate.month, item.endDate.day) ==
                                                                          DateTime(
                                                                              _selectedDay
                                                                                  .year,
                                                                              _selectedDay
                                                                                  .month,
                                                                              _selectedDay
                                                                                  .day)
                                                                      ? DateFormatConstants
                                                                          .timeFormat
                                                                          .format(
                                                                              item.endDate)
                                                                      : '〜',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14.0),
                                                                ),
                                                              ],
                                                            ),
                                                    ),
                                                    Container(
                                                      width: 5.0,
                                                      height: 50.0,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0),
                                                      child: Container(
                                                        width: 200.0,
                                                        child: Text(
                                                          item.title,
                                                          style: TextStyle(
                                                              fontSize: 18.0),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ));
          },
        ));
  }
}

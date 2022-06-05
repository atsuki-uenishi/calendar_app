import 'package:calendar_app/constants/text_constants.dart';
import 'package:calendar_app/model/schedule_database_provider.dart';
import 'package:calendar_app/routing/routes.dart';
import 'package:flutter/material.dart';

import 'package:calendar_app/service/schedule_db.dart';
import 'package:calendar_app/constants/date_format_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/model/selected_day_state.dart';

class SchedulesList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedDay = ref.watch(selectedDayState);
    final scheduleProvider = ref.watch(scheduleDatabaseProvider.notifier);

    Future<List<ScheduleItemData>> getScheduleItemList() async {
      return await scheduleProvider.makeSelectedDayList(_selectedDay);
    }

    return FutureBuilder(
        future: getScheduleItemList(),
        builder: (context, AsyncSnapshot<List<ScheduleItemData>> snapshot) {
          final scheduleList = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          }
          return Column(
            children: [
              for (ScheduleItemData item in scheduleList!)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      top: BorderSide(
                        color: Color(0xFFBDBDBD),
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            child: item.allDay
                                ? Text(TextConstants.allDayText)
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.startDate
                                                    .difference(_selectedDay)
                                                    .inDays ==
                                                0
                                            ? DateFormatConstants.timeFormat
                                                .format(item.startDate)
                                            : '',
                                        style: const TextStyle(fontSize: 14.0),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        item.endDate
                                                    .difference(_selectedDay)
                                                    .inDays ==
                                                0
                                            ? DateFormatConstants.timeFormat
                                                .format(item.endDate)
                                            : '',
                                        style: const TextStyle(fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                          ),
                          Container(
                            width: 5.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              item.title,
                              style: TextStyle(fontSize: 18.0),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        });
  }
}

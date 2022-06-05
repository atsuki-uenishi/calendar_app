import 'package:calendar_app/service/schedule_db.dart';
import 'package:flutter/material.dart';
import 'package:calendar_app/view/home_view.dart';
import 'package:calendar_app/view/schedules_list_view.dart';
import 'package:calendar_app/view/schedule_add_view.dart';
import 'package:calendar_app/view/schedule_edit_view.dart';

class RouteGenerator {
  static const String homeView = '/';

  static const String schedulesListView = '/schedulesList';

  static const String scheduleAddView = '/scheduleAdd';

  static const String scheduleEditView = '/scheduleEdit';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;
    switch (settings.name) {
      case homeView:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case schedulesListView:
        return MaterialPageRoute(
          builder: (_) => SchedulesListView(),
        );
      case scheduleAddView:
        return MaterialPageRoute(
          builder: (_) => ScheduleAddView(),
        );
      case scheduleEditView:
        return MaterialPageRoute(
          builder: (_) => ScheduleEditView(),
        );
      default:
        throw RouteException('Route not found');
    }
  }
}

class RouteException {
  final String message;
  const RouteException(this.message);
}

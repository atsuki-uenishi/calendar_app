import 'package:intl/intl.dart';

class DateFormatConstants {
  static DateFormat monthPickerFormat = DateFormat('yyyy年MM月  ▾');
  static DateFormat dateFormatForDayOfWeek = DateFormat.E('ja');
  static DateFormat schedulesListFormat = DateFormat('yyyy/MM/dd');
  static DateFormat timeFormat = DateFormat('HH:mm');
  static DateFormat scheduleDateTimeTileAllDayOffFormat =
      DateFormat('yyyy-MM-dd HH:mm');
  static DateFormat scheduleDateTimeTileAllDayOnFormat =
      DateFormat('yyyy-MM-dd');
}

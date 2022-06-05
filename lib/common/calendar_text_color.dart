import 'package:flutter/material.dart';

class CalendarTextColor {
  static Color textColor(DateTime day) {
    const _defaultTextColor = Colors.black54;

    if (day.weekday == DateTime.sunday) {
      return Colors.red;
    }
    if (day.weekday == DateTime.saturday) {
      return Colors.blue;
    }
    return _defaultTextColor;
  }
}

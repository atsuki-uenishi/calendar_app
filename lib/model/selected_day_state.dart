import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDayState = StateProvider<DateTime>((ref) => DateTime.now());

import 'package:flutter/material.dart';

class FormatUtils {
  static TimeOfDay stringToTimeOfDay(String timeString) {
    final parts = timeString.split(':');
    if (parts.length != 2) return TimeOfDay(hour: 0, minute: 0);
    
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  /// string should be hh:mm
  static String timeOfDayToString(TimeOfDay time) {
    final String h = time.hour.toString().padLeft(2, '0');
    final String m = time.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}

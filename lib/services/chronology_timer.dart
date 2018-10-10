import 'dart:async';

import 'package:quiver/async.dart';
import 'package:quiver/time.dart';

const int TIME_INTERVAL = 5;

class ChronologyTimer {
  // Singleton
  static final ChronologyTimer _singelton = ChronologyTimer._internal();
  factory ChronologyTimer() => _singelton;
  // private, named constructor
  ChronologyTimer._internal();

  Stream<DateTime> minuteStream() {
    final now = Clock().now();
    return Metronome.periodic(Duration(minutes: 1),
        anchor:
            DateTime(now.year, now.month, now.day, now.hour, now.minute, 0, 0));
  }

  Stream<DateTime> timeStream() {
    final now = Clock().now();
    final minute = now.minute - now.minute % TIME_INTERVAL;
    return Metronome.periodic(Duration(minutes: TIME_INTERVAL),
        anchor: DateTime(now.year, now.month, now.day, now.hour, minute, 0, 0));
  }
}

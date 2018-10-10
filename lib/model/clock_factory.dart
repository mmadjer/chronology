import 'package:flutter/material.dart';

import 'clock_base.dart';
import 'clock_english.dart';
import 'clock_german.dart';

class ClockFactory {
  static ClockBase clock({Locale of}) {
    switch (of.languageCode) {
      case 'de':
        return ClockGerman();
      default:
        return ClockEnglish();
    }
  }
}

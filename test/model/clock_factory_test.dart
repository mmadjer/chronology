import 'package:chronology/model/clock_english.dart';
import 'package:chronology/model/clock_factory.dart';
import 'package:chronology/model/clock_german.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Returns instance of ClockGerman when language code is de', () {
    final model = ClockFactory.clock(of: Locale('de'));
    expect(model, isInstanceOf<ClockGerman>());
  });

  test('Returns instance of ClockEnglish when language code is en', () {
    final model = ClockFactory.clock(of: Locale('en'));
    expect(model, isInstanceOf<ClockEnglish>());
  });

  test('Returns instance of ClockEnglish when language code is not supported',
      () {
    final model = ClockFactory.clock(of: Locale('jp'));
    expect(model, isInstanceOf<ClockEnglish>());
  });
}

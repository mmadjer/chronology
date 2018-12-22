import 'package:chronology/model/clock_english.dart';
import 'package:chronology/model/word_position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('English Clock Test', () {
    test('Time check - 17:00:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 0, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(6, 4, 7),
            WordPosition(9, 5, 10)
          ]));
    });

    test('Time check - 17:10:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 10, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(3, 5, 7),
            WordPosition(4, 0, 3),
            WordPosition(6, 4, 7),
          ]));
    });

    test('Time check - 17:15:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 15, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(1, 2, 8),
            WordPosition(4, 0, 3),
            WordPosition(6, 4, 7),
          ]));
    });

    test('Time check - 17:20:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 20, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(2, 0, 5),
            WordPosition(4, 0, 3),
            WordPosition(6, 4, 7),
          ]));
    });

    test('Time check - 17:25:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 25, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(2, 0, 9),
            WordPosition(4, 0, 3),
            WordPosition(6, 4, 7),
          ]));
    });

    test('Time check - 17:30:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 30, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(3, 0, 3),
            WordPosition(4, 0, 3),
            WordPosition(6, 4, 7),
          ]));
    });

    test('Time check - 17:35:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 35, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(2, 0, 9),
            WordPosition(3, 9, 10),
            WordPosition(5, 3, 5),
          ]));
    });

    test('Time check - 17:40:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 40, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(2, 0, 5),
            WordPosition(3, 9, 10),
            WordPosition(5, 3, 5),
          ]));
    });

    test('Time check - 17:45:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 45, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(1, 2, 8),
            WordPosition(3, 9, 10),
            WordPosition(5, 3, 5),
          ]));
    });

    test('Time check - 17:50:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 50, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(3, 5, 7),
            WordPosition(3, 9, 10),
            WordPosition(5, 3, 5),
          ]));
    });

    test('Time check - 17:55:00', () {
      final model = ClockEnglish();
      final time = DateTime(2018, 7, 7, 17, 55, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 4),
            WordPosition(2, 6, 9),
            WordPosition(3, 9, 10),
            WordPosition(5, 3, 5),
          ]));
    });

    group('12 hour format time', () {
      test('Time check - 5:00:00', () {
        final model = ClockEnglish();
        final time = DateTime(2018, 7, 7, 5, 0, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 4),
              WordPosition(6, 4, 7),
              WordPosition(9, 5, 10)
            ]));
      });
    });

    group('Edge cases', () {
      test('Time check - 17:05:00', () {
        final model = ClockEnglish();
        final time = DateTime(2018, 7, 7, 17, 5, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 4),
              WordPosition(2, 6, 9),
              WordPosition(4, 0, 3),
              WordPosition(6, 4, 7)
            ]));
      });

      test('Time check - 16:55:00', () {
        final model = ClockEnglish();
        final time = DateTime(2018, 7, 7, 16, 55, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 4),
              WordPosition(2, 6, 9),
              WordPosition(3, 9, 10),
              WordPosition(6, 4, 7)
            ]));
      });

      test('Time check - 10:10:00', () {
        final model = ClockEnglish();
        final time = DateTime(2018, 7, 7, 10, 10, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 4),
              WordPosition(3, 5, 7),
              WordPosition(4, 0, 3),
              WordPosition(9, 0, 2)
            ]));
      });

      test('Time check - 09:50:00', () {
        final model = ClockEnglish();
        final time = DateTime(2018, 7, 7, 9, 50, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 4),
              WordPosition(3, 5, 7),
              WordPosition(3, 9, 10),
              WordPosition(9, 0, 2)
            ]));
      });
    });
  });
}

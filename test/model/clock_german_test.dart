import 'package:chronology/model/clock_german.dart';
import 'package:chronology/model/word_position.dart';
import 'package:test/test.dart';

void main() {
  group('German Clock Test', () {
    test('Time check - 17:00:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 0, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(4, 7, 10),
            WordPosition(9, 8, 10)
          ]));
    });

    test('Time check - 17:10:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 10, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(1, 0, 3),
            WordPosition(3, 7, 10),
            WordPosition(4, 7, 10),
          ]));
    });

    test('Time check - 17:15:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 15, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(2, 4, 10),
            WordPosition(3, 7, 10),
            WordPosition(4, 7, 10),
          ]));
    });

    test('Time check - 17:20:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 20, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(1, 0, 3),
            WordPosition(3, 0, 2),
            WordPosition(4, 0, 3),
            WordPosition(7, 0, 4),
          ]));
    });

    test('Time check - 17:25:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 25, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(0, 7, 10),
            WordPosition(3, 0, 2),
            WordPosition(4, 0, 3),
            WordPosition(7, 0, 4),
          ]));
    });

    test('Time check - 17:30:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 30, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(4, 0, 3),
            WordPosition(7, 0, 4),
          ]));
    });

    test('Time check - 17:35:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 35, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(0, 7, 10),
            WordPosition(3, 7, 10),
            WordPosition(4, 0, 3),
            WordPosition(7, 0, 4),
          ]));
    });

    test('Time check - 17:40:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 40, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(1, 0, 3),
            WordPosition(3, 7, 10),
            WordPosition(4, 0, 3),
            WordPosition(7, 0, 4),
          ]));
    });

    test('Time check - 17:45:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 45, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(2, 4, 10),
            WordPosition(3, 0, 2),
            WordPosition(7, 0, 4),
          ]));
    });

    test('Time check - 17:50:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 50, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(1, 0, 3),
            WordPosition(3, 0, 2),
            WordPosition(7, 0, 4),
          ]));
    });

    test('Time check - 17:55:00', () {
      final model = ClockGerman();
      final time = DateTime(2018, 7, 7, 17, 55, 0);
      final positions = model.wordPositions(time);
      expect(
          positions,
          orderedEquals([
            WordPosition(0, 0, 1),
            WordPosition(0, 3, 5),
            WordPosition(0, 7, 10),
            WordPosition(3, 0, 2),
            WordPosition(7, 0, 4),
          ]));
    });

    group('12 hour format time', () {
      test('Time check - 5:00:00', () {
        final model = ClockGerman();
        final time = DateTime(2018, 7, 7, 5, 0, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 5),
              WordPosition(4, 7, 10),
              WordPosition(9, 8, 10)
            ]));
      });
    });

    group('Edge cases', () {
      test('Time check - 17:05:00', () {
        final model = ClockGerman();
        final time = DateTime(2018, 7, 7, 17, 5, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 5),
              WordPosition(0, 7, 10),
              WordPosition(3, 7, 10),
              WordPosition(4, 7, 10)
            ]));
      });

      test('Time check - 16:55:00', () {
        final model = ClockGerman();
        final time = DateTime(2018, 7, 7, 16, 55, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 5),
              WordPosition(0, 7, 10),
              WordPosition(3, 0, 2),
              WordPosition(4, 7, 10)
            ]));
      });

      test('Time check - 15:05:00', () {
        final model = ClockGerman();
        final time = DateTime(2018, 7, 7, 15, 5, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 5),
              WordPosition(0, 7, 10),
              WordPosition(3, 7, 10),
              WordPosition(6, 0, 3)
            ]));
      });

      test('Time check - 10:10:00', () {
        final model = ClockGerman();
        final time = DateTime(2018, 7, 7, 10, 10, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 5),
              WordPosition(1, 0, 3),
              WordPosition(3, 7, 10),
              WordPosition(9, 0, 3)
            ]));
      });

      test('Time check - 09:50:00', () {
        final model = ClockGerman();
        final time = DateTime(2018, 7, 7, 9, 50, 0);
        final positions = model.wordPositions(time);
        expect(
            positions,
            orderedEquals([
              WordPosition(0, 0, 1),
              WordPosition(0, 3, 5),
              WordPosition(1, 0, 3),
              WordPosition(3, 0, 2),
              WordPosition(9, 0, 3)
            ]));
      });
    });
  });
}

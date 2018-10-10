import 'word_position.dart';

abstract class ClockBase {
  final List<String> matrix = [];
  List<WordPosition> wordPositions(DateTime time);
}

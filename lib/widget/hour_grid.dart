import 'package:flutter/material.dart';
import 'package:quiver/time.dart';

import '../model/clock_base.dart';
import '../model/word_position.dart';
import '../services/chronology_timer.dart';
import '../theme/dimension.dart';

/// The [HourGrid] Widget represents the hour display.
///
/// It is modeled as a [Stream] of immutable instances of [DateTime].
/// Every 5 minutes results in a new [DateTime], which is
/// sent downstream. [HourGrid] uses a [StreamBuilder] wired up to that stream
/// of models to build out its [Widget] tree.
class HourGrid extends StatelessWidget {
  final ClockBase model;

  HourGrid({Key key, this.model}) : super(key: key);

  TextStyle _textStyle(context, shouldHighlight) {
    final textTheme = Theme.of(context).textTheme;
    final dimension = Dimension.of(context);
    return shouldHighlight
        ? textTheme.body1
            .copyWith(fontSize: textTheme.body1.fontSize * dimension.fontRatio)
        : textTheme.body2
            .copyWith(fontSize: textTheme.body1.fontSize * dimension.fontRatio);
  }

  List<Widget> _buildGrid(
      BuildContext context, List<WordPosition> wordPositions) {
    final result = List<Widget>();
    final matrix = model.matrix;

    for (int i = 0; i < matrix.length; i++) {
      final line = matrix[i];
      final positions = wordPositions.where((pos) => pos.row == i);
      for (int j = 0; j < line.length; j++) {
        final letter = line[j];
        final shouldHighlight =
            positions.any((pos) => j >= pos.start && j <= pos.stop);
        result.add(GridTile(
          child: Text(
            letter,
            style: _textStyle(context, shouldHighlight),
          ),
        ));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
        stream: ChronologyTimer().timeStream(),
        initialData: Clock().now(),
        builder: (context, snapshot) {
          final dateTime = snapshot.data;
          final wordPositions = model.wordPositions(dateTime);
          final dimension = Dimension.of(context);

          return GridView.count(
            crossAxisCount: model.matrix.first.length,
            shrinkWrap: true,
            childAspectRatio: 1.0, // This means each cell is a square
            padding: EdgeInsets.only(
                right: dimension.paddingMedium, left: dimension.paddingMedium),
            mainAxisSpacing: dimension.spacingMedium,
            crossAxisSpacing: 2.0,
            children: _buildGrid(context, wordPositions),
          );
        });
  }
}

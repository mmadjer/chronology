import 'package:flutter/material.dart';
import 'package:quiver/time.dart';

import '../services/chronology_timer.dart';
import '../theme/dimension.dart';

/// The [MinuteCircle] Widget represents the minute indicator.
///
/// It is modeled as a [Stream] of immutable instances of [DateTime].
/// Every minute results in a new [DateTime], which is
/// sent downstream. [MinuteCircle] uses a [StreamBuilder] wired up to that stream
/// of models to build out its [Widget] tree.
class MinuteCircle extends StatelessWidget {
  final int index;

  MinuteCircle({Key key, @required this.index})
      : assert(index != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
        stream: ChronologyTimer().minuteStream(),
        initialData: Clock().now(),
        builder: (context, snapshot) {
          final dateTime = snapshot.data;
          final currentMinute = dateTime.minute % TIME_INTERVAL;
          final active = currentMinute >= index;
          final theme = Theme.of(context);
          final size = Dimension.of(context).isPhone ? 8.0 : 12.0;

          return AnimatedContainer(
            duration: Duration(
              milliseconds: 500,
            ),
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? theme.highlightColor : theme.disabledColor,
            ),
          );
        });
  }
}

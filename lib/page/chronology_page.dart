import 'package:flutter/material.dart';

import '../model/app_configuration.dart';
import '../model/clock_base.dart';
import '../model/clock_factory.dart';
import '../theme/dimension.dart';
import '../widget/hour_grid.dart';
import '../widget/minute_circle.dart';

/// The [ChronologyPage] Widget represents the entire clock display.
class ChronologyPage extends StatefulWidget {
  ChronologyPage({Key key, this.configuration, this.updater}) : super(key: key);

  final AppConfiguration configuration;
  final ValueChanged<AppConfiguration> updater;

  @override
  _ChronologyPageState createState() => _ChronologyPageState();
}

/// State class for [ChronologyPage].
class _ChronologyPageState extends State<ChronologyPage> {
  ClockBase _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _model = ClockFactory.clock(of: Localizations.localeOf(context));
  }

  void _handleDragEnd(DismissDirection direction) {
    final newValue = widget.configuration.themeIndex +
        (direction == DismissDirection.endToStart ? 1 : -1);
    sendUpdates(widget.configuration.copyWith(themeIndex: newValue));
  }

  void sendUpdates(AppConfiguration value) {
    if (widget.updater != null) widget.updater(value);
  }

  @override
  Widget build(BuildContext context) {
    final dimension = Dimension.of(context);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(dimension.paddingMedium),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  MinuteCircle(index: 1),
                  Spacer(),
                  MinuteCircle(index: 2),
                ],
              ),
              HourGrid(model: _model),
              Row(
                children: <Widget>[
                  MinuteCircle(
                    index: 3,
                  ),
                  Spacer(),
                  MinuteCircle(
                    index: 4,
                  ),
                ],
              )
            ],
          ),
          Dismissible(
            key: Key('Dismissible#1'),
            resizeDuration: null,
            onDismissed: _handleDragEnd,
            child: Placeholder(
              color: Colors.transparent,
              strokeWidth: 0.0,
            ),
          )
        ],
      ),
    ));
  }
}

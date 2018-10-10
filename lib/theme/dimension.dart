import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'dimension_data.dart';

class Dimension extends StatelessWidget {
  final DimensionData data;
  final Widget child;

  const Dimension({
    Key key,
    @required this.data,
    @required this.child,
  })  : assert(child != null),
        assert(data != null),
        super(key: key);

  static DimensionData of(BuildContext context) {
    final _InheritedDimension inheritedDimension =
        context.inheritFromWidgetOfExactType(_InheritedDimension);
    return (inheritedDimension != null)
        ? inheritedDimension.dimension.data
        : _kFallbackDimension;
  }

  static final DimensionData _kFallbackDimension = DimensionData.fallback();

  @override
  Widget build(BuildContext context) {
    return _InheritedDimension(
      dimension: this,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        new DiagnosticsProperty<DimensionData>('data', data, showName: false));
  }
}

class _InheritedDimension extends InheritedWidget {
  const _InheritedDimension(
      {Key key, @required this.dimension, @required Widget child})
      : assert(dimension != null),
        super(key: key, child: child);

  final Dimension dimension;

  @override
  bool updateShouldNotify(_InheritedDimension old) =>
      dimension.data != old.dimension.data;
}

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum Device {
  tablet,
  phone,
}

@immutable
class DimensionData extends Diagnosticable {
  factory DimensionData({
    Device device,
    double fontRatio,
    double paddingSmall,
    double paddingMedium,
    double paddingLarge,
    double spacingSmall,
    double spacingMedium,
    double spacingLarge,
  }) {
    device ??= Device.phone;
    fontRatio ??= 1.0;
    paddingSmall ??= 8.0;
    paddingMedium ??= 16.0;
    paddingLarge ??= 24.0;
    spacingSmall ??= 8.0;
    spacingMedium ??= 16.0;
    spacingLarge ??= 24.0;
    return DimensionData.raw(
        device: device,
        fontRatio: fontRatio,
        paddingSmall: paddingSmall,
        paddingMedium: paddingMedium,
        paddingLarge: paddingLarge,
        spacingSmall: spacingSmall,
        spacingMedium: spacingMedium,
        spacingLarge: spacingLarge);
  }

  const DimensionData.raw({
    @required this.device,
    @required this.fontRatio,
    @required this.paddingSmall,
    @required this.paddingMedium,
    @required this.paddingLarge,
    @required this.spacingSmall,
    @required this.spacingMedium,
    @required this.spacingLarge,
  })  : assert(device != null),
        assert(fontRatio != null),
        assert(paddingSmall != null),
        assert(paddingMedium != null),
        assert(paddingLarge != null),
        assert(spacingSmall != null),
        assert(spacingMedium != null),
        assert(spacingLarge != null);

  static const int kTabletBreakpoint = 600;

  factory DimensionData.tablet() => DimensionData(device: Device.tablet);

  factory DimensionData.phone() => DimensionData(device: Device.phone);

  factory DimensionData.fallback() => DimensionData.phone();

  final Device device;
  final double fontRatio;
  final double paddingSmall;
  final double paddingMedium;
  final double paddingLarge;
  final double spacingSmall;
  final double spacingMedium;
  final double spacingLarge;

  bool get isPhone => this.device == Device.phone;

  DimensionData copyWith(
      {Device device,
      double fontRatio,
      double paddingSmall,
      double paddingMedium,
      double paddingLarge,
      double spacingSmall,
      double spacingMedium,
      double spacingLarge}) {
    return DimensionData.raw(
        device: device ?? this.device,
        fontRatio: fontRatio ?? this.fontRatio,
        paddingSmall: paddingSmall ?? this.paddingSmall,
        paddingMedium: paddingMedium ?? this.paddingMedium,
        paddingLarge: paddingLarge ?? this.paddingLarge,
        spacingSmall: spacingSmall ?? this.spacingSmall,
        spacingMedium: spacingMedium ?? this.spacingMedium,
        spacingLarge: spacingLarge ?? this.spacingLarge);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    final DimensionData otherData = other;
    return (otherData.device == device) &&
        (otherData.fontRatio == fontRatio) &&
        (otherData.paddingSmall == paddingSmall) &&
        (otherData.paddingMedium == paddingMedium) &&
        (otherData.paddingLarge == paddingLarge) &&
        (otherData.spacingSmall == spacingSmall) &&
        (otherData.spacingMedium == spacingMedium) &&
        (otherData.spacingLarge == spacingLarge);
  }

  @override
  int get hashCode {
    return hashValues(
      device,
      fontRatio,
      paddingSmall,
      paddingMedium,
      paddingLarge,
      spacingSmall,
      spacingMedium,
      spacingLarge,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final DimensionData defaultData = DimensionData.fallback();
    properties.add(EnumProperty<Device>('device', device,
        defaultValue: defaultData.device));
    properties.add(DiagnosticsProperty<double>('fontRatio', fontRatio,
        defaultValue: defaultData.fontRatio));
    properties.add(DiagnosticsProperty<double>('paddingSmall', paddingSmall,
        defaultValue: defaultData.paddingSmall));
    properties.add(DiagnosticsProperty<double>('paddingMedium', paddingMedium,
        defaultValue: defaultData.paddingMedium));
    properties.add(DiagnosticsProperty<double>('paddingLarge', paddingLarge,
        defaultValue: defaultData.paddingLarge));
    properties.add(DiagnosticsProperty<double>('spacingSmall', spacingSmall,
        defaultValue: defaultData.spacingSmall));
    properties.add(DiagnosticsProperty<double>('spacingMedium', spacingMedium,
        defaultValue: defaultData.spacingMedium));
    properties.add(DiagnosticsProperty<double>('spacingLarge', spacingLarge,
        defaultValue: defaultData.spacingLarge));
  }
}

import 'dimension_data.dart';

final DimensionData phoneDimensions = _buildDimensionPhone();
final DimensionData tabletDimensions = _buildDimensionTablet();

DimensionData _buildDimensionPhone() {
  final DimensionData base = DimensionData.phone();
  return base;
}

DimensionData _buildDimensionTablet() {
  final DimensionData base = DimensionData.tablet();
  return base.copyWith(
    fontRatio: 1.4,
    paddingSmall: 24.0,
    paddingMedium: 32.0,
    paddingLarge: 40.0,
  );
}

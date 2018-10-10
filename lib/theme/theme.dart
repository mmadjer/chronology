import 'package:flutter/material.dart';

import 'colors.dart';

final List<ThemeData> kThemes = [
  _buildThemeDark(kBlack),
  _buildThemeDark(kBrown),
  _buildThemeLight(kOrange),
  _buildThemeDark(kDeepPurple),
  _buildThemeDark(kIndigo),
  _buildThemeLight(kLightGreen),
  _buildThemeLight(kPink),
  _buildThemeLight(kTeal)
];

ThemeData _buildThemeDark(Color color) {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: color,
    scaffoldBackgroundColor: color,
    disabledColor: kTextWhite24,
    highlightColor: kTextWhite,
    textTheme: _buildTextThemeDark(base.textTheme),
    primaryTextTheme: _buildTextThemeDark(base.primaryTextTheme),
    accentTextTheme: _buildTextThemeDark(base.accentTextTheme),
  );
}

ThemeData _buildThemeLight(Color color) {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: color,
    scaffoldBackgroundColor: color,
    disabledColor: kTextWhite50,
    highlightColor: kTextWhite,
    textTheme: _buildTextThemeLight(base.textTheme),
    primaryTextTheme: _buildTextThemeLight(base.primaryTextTheme),
    accentTextTheme: _buildTextThemeLight(base.accentTextTheme),
  );
}

TextTheme _buildTextThemeDark(TextTheme base) {
  return base.copyWith(
    body1: base.body1.copyWith(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: kTextWhite),
    body2: base.body2.copyWith(
        fontSize: 20.0, fontWeight: FontWeight.w300, color: kTextWhite24),
  );
}

TextTheme _buildTextThemeLight(TextTheme base) {
  return base.copyWith(
    body1: base.body1.copyWith(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: kTextWhite),
    body2: base.body2.copyWith(
        fontSize: 20.0, fontWeight: FontWeight.w300, color: kTextWhite50),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

/// Main function for the app. Turns off the system overlays and locks portrait
/// orientation for a more game-like UI, loads theme, and then runs the [Widget] tree.
void main() async {
  final prefs = await SharedPreferences.getInstance();
  final themeIndex = prefs.getInt("themeIndex") ?? 0;

  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ChronologyApp(initialThemeIndex: themeIndex));
}

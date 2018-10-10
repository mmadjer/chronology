import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/localization.dart';
import 'model/app_configuration.dart';
import 'page/chronology_page.dart';
import 'theme/dimension.dart';
import 'theme/dimension_data.dart';
import 'theme/dimensions.dart';
import 'theme/theme.dart';

/// The App class.
class ChronologyApp extends StatefulWidget {
  final int initialThemeIndex;

  ChronologyApp({Key key, this.initialThemeIndex});

  @override
  ChronologyAppState createState() => ChronologyAppState();
}

/// State class for [ChronologyApp].
class ChronologyAppState extends State<ChronologyApp> {
  AppConfiguration _configuration;

  @override
  initState() {
    super.initState();

    _configuration = AppConfiguration(themeIndex: widget.initialThemeIndex);
  }

  void configurationUpdater(AppConfiguration value) async {
    setState(() {
      if (value.themeIndex < 0) {
        _configuration = value.copyWith(themeIndex: kThemes.length - 1);
      } else if (value.themeIndex >= kThemes.length) {
        _configuration = value.copyWith(themeIndex: 0);
      } else {
        _configuration = value;
      }
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("themeIndex", _configuration.themeIndex);
  }

  ThemeData get theme {
    return kThemes[_configuration.themeIndex];
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQueryData.fromWindow(ui.window),
        child: Builder(builder: (context) {
          final shortestSide = MediaQuery.of(context).size.shortestSide;
          final dimensionData = shortestSide < DimensionData.kTabletBreakpoint
              ? phoneDimensions
              : tabletDimensions;
          return Dimension(
              data: dimensionData,
              child: Builder(builder: (context) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  home: ChronologyPage(
                      configuration: _configuration,
                      updater: configurationUpdater),
                  localizationsDelegates: [
                    AppLocalizationsDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                  supportedLocales: [
                    const Locale('en', 'US'),
                    const Locale('de', 'DE'),
                  ],
                  onGenerateTitle: (BuildContext context) =>
                      AppLocalizations.of(context).title,
                );
              }));
        }));
  }
}

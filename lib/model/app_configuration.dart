class AppConfiguration {
  final int themeIndex;

  AppConfiguration({this.themeIndex = 0});

  AppConfiguration copyWith({int themeIndex}) {
    return AppConfiguration(themeIndex: themeIndex ?? this.themeIndex);
  }
}

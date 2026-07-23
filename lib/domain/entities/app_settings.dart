class AppSettings {
  final bool startAutomatically;
  final bool hideWindowAtStart;
  final bool setLimitAuto;
  final int interval;
  final int limitPercent;
  AppSettings({
    required this.startAutomatically,
    required this.hideWindowAtStart,
    required this.setLimitAuto,
    required this.interval,
    required this.limitPercent,
  });
  AppSettings copyWith({
    bool? startAutomatically,
    bool? hideWindowAtStart,
    bool? setLimitAuto,
    int? interval,
    int? limitPercent,
  }) {
    return AppSettings(
      startAutomatically: startAutomatically ?? this.startAutomatically,
      hideWindowAtStart: hideWindowAtStart ?? this.hideWindowAtStart,
      setLimitAuto: setLimitAuto ?? this.setLimitAuto,
      interval: interval ?? this.interval,
      limitPercent: limitPercent ?? this.limitPercent,
    );
  }
}

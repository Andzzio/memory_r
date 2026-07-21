class SettingsState {
  final bool startAutomatically;
  final bool hideWindowAtStart;
  final bool setLimitAuto;
  final int interval;
  final int limitPercent;
  SettingsState({
    this.startAutomatically = false,
    this.hideWindowAtStart = false,
    this.setLimitAuto = false,
    this.interval = 5,
    this.limitPercent = 80,
  });
  SettingsState copyWith({
    bool? startAutomatically,
    bool? hideWindowAtStart,
    bool? setLimitAuto,
    int? interval,
    int? limitPercent,
  }) {
    return SettingsState(
      startAutomatically: startAutomatically ?? this.startAutomatically,
      hideWindowAtStart: hideWindowAtStart ?? this.hideWindowAtStart,
      setLimitAuto: setLimitAuto ?? this.setLimitAuto,
      interval: interval ?? this.interval,
      limitPercent: limitPercent ?? this.limitPercent,
    );
  }
}

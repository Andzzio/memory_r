import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/presentation/providers/settings_state.dart';

class SettingsProvider extends Notifier<SettingsState> {
  @override
  SettingsState build() {
    return SettingsState();
  }

  void toggleStartAutomatically() {
    state = state.copyWith(startAutomatically: !state.startAutomatically);
  }

  void toggleHideWindowAtStart() {
    state = state.copyWith(hideWindowAtStart: !state.hideWindowAtStart);
  }

  void toggleSetLimitAuto() {
    state = state.copyWith(setLimitAuto: !state.setLimitAuto);
  }

  void updateInterval(int newInterval) {
    state = state.copyWith(interval: newInterval);
  }

  void updateLimitPercent(int newLimitPercent) {
    state = state.copyWith(limitPercent: newLimitPercent);
  }
}

final settingsProvider = NotifierProvider<SettingsProvider, SettingsState>(
  SettingsProvider.new,
);

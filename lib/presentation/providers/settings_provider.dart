import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/domain/entities/app_settings.dart';
import 'package:memory_r/providers/settings_providers.dart';

class SettingsProvider extends Notifier<AppSettings> {
  @override
  AppSettings build() {
    return ref.watch(loadConfigUsecaseProvider).call();
  }

  void toggleStartAutomatically() async {
    state = state.copyWith(startAutomatically: !state.startAutomatically);
    await ref.read(saveConfigUsecaseProvider).call(state);
  }

  void toggleHideWindowAtStart() async {
    state = state.copyWith(hideWindowAtStart: !state.hideWindowAtStart);
    await ref.read(saveConfigUsecaseProvider).call(state);
  }

  void toggleSetLimitAuto() async {
    state = state.copyWith(setLimitAuto: !state.setLimitAuto);
    await ref.read(saveConfigUsecaseProvider).call(state);
  }

  void updateInterval(int newInterval) async {
    state = state.copyWith(interval: newInterval);
    await ref.read(saveConfigUsecaseProvider).call(state);
  }

  void updateLimitPercent(int newLimitPercent) async {
    state = state.copyWith(limitPercent: newLimitPercent);
    await ref.read(saveConfigUsecaseProvider).call(state);
  }
}

final settingsProvider = NotifierProvider<SettingsProvider, AppSettings>(
  SettingsProvider.new,
);

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/core/app_logger.dart';
import 'package:memory_r/domain/entities/app_settings.dart';
import 'package:memory_r/providers/services_providers.dart';
import 'package:memory_r/providers/settings_providers.dart';

class SettingsProvider extends Notifier<AppSettings> {
  @override
  AppSettings build() {
    return ref.watch(loadConfigUsecaseProvider).call();
  }

  void toggleStartAutomatically() async {
    final newValue = !state.startAutomatically;
    final launchAtStartupService = ref.read(launchAtStartupServiceProvider);
    if (!kDebugMode) {
      try {
        newValue
            ? await launchAtStartupService.enable()
            : await launchAtStartupService.disable();
      } catch (e) {
        appLogger.w('Error has ocurred in automatically startup');
        return;
      }
    }
    state = state.copyWith(startAutomatically: newValue);
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

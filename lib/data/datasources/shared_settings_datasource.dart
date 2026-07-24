import 'package:memory_r/domain/entities/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedSettingsDatasource {
  final SharedPreferences prefs;
  SharedSettingsDatasource({required this.prefs});
  static const String startAutomaticallyKey = 'start_automatically';
  static const String hideWindowAtStartKey = 'hide_window_at_start';
  static const String setLimitAutoKey = 'set_limit_auto';
  static const String intervalKey = 'interval';
  static const String limitPercentKey = 'limit_percent';

  AppSettings loadConfig() {
    final bool? startAutomatically = prefs.getBool(startAutomaticallyKey);
    final bool? hideWindowAtStart = prefs.getBool(hideWindowAtStartKey);
    final bool? setLimitAuto = prefs.getBool(setLimitAutoKey);
    final int? interval = prefs.getInt(intervalKey);
    final int? limitPercent = prefs.getInt(limitPercentKey);
    return AppSettings(
      startAutomatically: startAutomatically ?? false,
      hideWindowAtStart: hideWindowAtStart ?? false,
      setLimitAuto: setLimitAuto ?? false,
      interval: interval ?? 15,
      limitPercent: limitPercent ?? 75,
    );
  }

  Future<void> saveConfig(AppSettings settings) async {
    final bool startAutomatically = settings.startAutomatically;
    final bool hideWindowAtStart = settings.hideWindowAtStart;
    final bool setLimitAuto = settings.setLimitAuto;
    final int interval = settings.interval;
    final int limitPercent = settings.limitPercent;
    await prefs.setBool(startAutomaticallyKey, startAutomatically);
    await prefs.setBool(hideWindowAtStartKey, hideWindowAtStart);
    await prefs.setBool(setLimitAutoKey, setLimitAuto);
    await prefs.setInt(intervalKey, interval);
    await prefs.setInt(limitPercentKey, limitPercent);
  }
}

import 'package:memory_r/domain/entities/app_settings.dart';

abstract class SettingsRepository {
  AppSettings loadConfig();
  Future<void> saveConfig(AppSettings settings);
}

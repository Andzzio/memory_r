import 'package:memory_r/data/datasources/shared_settings_datasource.dart';
import 'package:memory_r/domain/entities/app_settings.dart';
import 'package:memory_r/domain/repos/settings_repository.dart';

class SharedSettingsRepositoryImpl implements SettingsRepository {
  final SharedSettingsDatasource datasource;
  SharedSettingsRepositoryImpl({required this.datasource});
  @override
  AppSettings loadConfig() {
    return datasource.loadConfig();
  }

  @override
  Future<void> saveConfig(AppSettings settings) async {
    return await datasource.saveConfig(settings);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/data/datasources/shared_settings_datasource.dart';
import 'package:memory_r/data/repos/shared_settings_repository_impl.dart';
import 'package:memory_r/domain/repos/settings_repository.dart';
import 'package:memory_r/domain/usecases/load_config_usecase.dart';
import 'package:memory_r/domain/usecases/save_config_usecase.dart';
import 'package:memory_r/providers/core/shared_preferences_provider.dart';

final sharedSettingsDatasourceProvider = Provider<SharedSettingsDatasource>((
  ref,
) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedSettingsDatasource(prefs: prefs);
});
final sharedSettingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SharedSettingsRepositoryImpl(
    datasource: ref.watch(sharedSettingsDatasourceProvider),
  ),
);
final loadConfigUsecaseProvider = Provider<LoadConfigUsecase>(
  (ref) => LoadConfigUsecase(repo: ref.watch(sharedSettingsRepositoryProvider)),
);
final saveConfigUsecaseProvider = Provider<SaveConfigUsecase>(
  (ref) => SaveConfigUsecase(repo: ref.watch(sharedSettingsRepositoryProvider)),
);

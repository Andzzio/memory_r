import 'package:memory_r/domain/entities/app_settings.dart';
import 'package:memory_r/domain/repos/settings_repository.dart';

class LoadConfigUsecase {
  final SettingsRepository repo;
  LoadConfigUsecase({required this.repo});
  AppSettings call() {
    return repo.loadConfig();
  }
}

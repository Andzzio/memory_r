import 'package:memory_r/domain/entities/app_settings.dart';
import 'package:memory_r/domain/repos/settings_repository.dart';

class SaveConfigUsecase {
  final SettingsRepository repo;
  SaveConfigUsecase({required this.repo});
  Future<void> call(AppSettings settings) async {
    return await repo.saveConfig(settings);
  }
}

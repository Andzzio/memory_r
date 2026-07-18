import 'package:memory_r/core/app_logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static late final String version;
  static Future<void> initialize() async {
    try {
      final info = await PackageInfo.fromPlatform();
      version = info.version;
    } catch (e) {
      appLogger.w('A error has ocurred with info initialize: $e');
    }
  }
}

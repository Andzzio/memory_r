import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/core/services/launch_at_startup_service.dart';
import 'package:memory_r/core/services/url_launcher_service.dart';

final urlLauncherServiceProvider = Provider<UrlLauncherService>(
  (ref) => UrlLauncherService(),
);
final launchAtStartupServiceProvider = Provider<LaunchAtStartupService>(
  (ref) => LaunchAtStartupService(),
);

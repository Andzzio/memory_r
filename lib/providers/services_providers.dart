import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/core/services/url_launcher_service.dart';

final urlLauncherServiceProvider = Provider<UrlLauncherService>(
  (ref) => UrlLauncherService(),
);

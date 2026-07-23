import 'package:launch_at_startup/launch_at_startup.dart';

class LaunchAtStartupService {
  Future<void> enable() async {
    await launchAtStartup.enable();
  }

  Future<void> disable() async {
    await launchAtStartup.disable();
  }
}

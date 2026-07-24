import 'dart:io';

class LaunchAtStartupService {
  String get _shortcutPath =>
      '${Platform.environment['APPDATA']}\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\Memory R.lnk';
  Future<void> enable() async {
    final script =
        "\$s = (New-Object -ComObject WScript.Shell).CreateShortcut('$_shortcutPath'); "
        "\$s.TargetPath = '${Platform.resolvedExecutable}'; "
        "\$s.Save();";
    await Process.run('powershell', [
      '-NoProfile',
      '-NonInteractive',
      '-Command',
      script,
    ]);
  }

  Future<void> disable() async {
    final shortcutFile = File(_shortcutPath);
    if (await shortcutFile.exists()) {
      await shortcutFile.delete();
    }
  }
}

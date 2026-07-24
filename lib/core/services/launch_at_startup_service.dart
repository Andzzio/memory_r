import 'dart:io';

class LaunchAtStartupService {
  String get _shortcutPath =>
      '${Platform.environment['APPDATA']}\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\Memory R.lnk';
  Future<void> enable() async {
    await Process.run('powershell', [
      '-Command',
      '''
\$TargetFile = "${Platform.resolvedExecutable}"
\$ShortcutFile = "$_shortcutPath"
\$WScriptShell = New-Object -ComObject WScript.Shell
\$Shortcut = \$WScriptShell.CreateShortcut(\$ShortcutFile)
\$Shortcut.TargetPath = \$TargetFile
\$Shortcut.Save()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject(\$WScriptShell)
    ''',
    ], runInShell: true);
  }

  Future<void> disable() async {
    final shortcutFile = File(_shortcutPath);
    if (await shortcutFile.exists()) {
      await shortcutFile.delete();
    }
  }
}

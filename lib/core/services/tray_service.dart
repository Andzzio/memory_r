import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class TrayService with TrayListener {
  final WindowManager winManager;
  TrayService({required this.winManager});
  Future<void> initialize() async {
    trayManager.addListener(this);
    await trayManager.setIcon('assets/images/icons/icono.ico');
    await trayManager.setToolTip('Memory R');
    await trayManager.setContextMenu(
      Menu(
        items: [
          MenuItem(
            key: 'open',
            label: 'Open',
            onClick: (menuItem) async {
              await winManager.show();
              await winManager.focus();
            },
          ),
          MenuItem(
            key: 'exit',
            label: 'Exit',
            onClick: (menuItem) async => await winManager.close(),
          ),
        ],
      ),
    );
  }

  @override
  void onTrayIconMouseDown() async {
    await winManager.show();
    await winManager.focus();
  }

  @override
  void onTrayIconRightMouseDown() async {
    await trayManager.popUpContextMenu();
  }
}

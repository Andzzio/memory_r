import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/config/app_info.dart';
import 'package:memory_r/config/app_router.dart';
import 'package:memory_r/core/services/tray_service.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(450, 250),
    center: true,
    //backgroundColor: Colors.transparent,
    skipTaskbar: false,
    title: 'Memory R',
    //titleBarStyle: TitleBarStyle.hidden,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setResizable(false);
    await windowManager.setTitleBarStyle(
      TitleBarStyle.hidden,
      windowButtonVisibility: false,
    );
    await windowManager.show();
    await windowManager.focus();
  });
  final trayService = TrayService(winManager: windowManager);
  await trayService.initialize();
  await AppInfo.initialize();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Memory R',
      theme: FluentThemeData(accentColor: Colors.blue),
      routerConfig: appRouter,
    );
  }
}

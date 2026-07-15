import 'package:go_router/go_router.dart';
import 'package:memory_r/presentation/screens/about_screen.dart';
import 'package:memory_r/presentation/screens/main_screen.dart';
import 'package:memory_r/presentation/screens/settings_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'main',
      builder: (context, state) => MainScreen(),
      routes: [
        GoRoute(
          path: 'settings',
          name: 'settings',
          builder: (context, state) => SettingsScreen(),
        ),
        GoRoute(
          path: 'about',
          name: 'about',
          builder: (context, state) => AboutScreen(),
        ),
      ],
    ),
  ],
);

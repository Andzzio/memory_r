import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class WindowButtons extends StatelessWidget {
  final double? size;
  const WindowButtons({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          IconButton(
            icon: WindowsIcon(WindowsIcons.chrome_minimize, size: size),
            onPressed: () {
              windowManager.hide();
            },
          ),
          IconButton(
            icon: WindowsIcon(WindowsIcons.chrome_maximize, size: size),
            onPressed: null,
          ),
          IconButton(
            icon: WindowsIcon(WindowsIcons.chrome_close, size: size),
            onPressed: () {
              windowManager.hide();
            },
          ),
        ],
      ),
    );
  }
}

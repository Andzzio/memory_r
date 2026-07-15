import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_r/presentation/widgets/window_buttons.dart';
import 'package:window_manager/window_manager.dart';

class ScreenLayout extends StatelessWidget {
  final Widget? child;
  const ScreenLayout({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      titleBar: TitleBar(
        onBackRequested: context.canPop() ? () => context.pop() : null,
        icon: WindowsIcon(WindowsIcons.ram),
        title: Text('Memory R'),
        captionControls: WindowButtons(size: 10),
        onDragStarted: () {
          windowManager.startDragging();
        },
      ),
      content: child,
    );
  }
}

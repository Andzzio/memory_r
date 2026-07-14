import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class ActionArea extends StatelessWidget {
  const ActionArea({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacing = 8;
    return SizedBox(
      child: Column(
        spacing: spacing,
        children: [
          Row(
            spacing: spacing,
            children: [
              Expanded(
                flex: 1,
                child: FilledButton(
                  child: Row(
                    spacing: 5,
                    children: [
                      WindowsIcon(WindowsIcons.broom),
                      Text('Optimize'),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                flex: 1,
                child: Button(
                  child: Row(
                    spacing: 5,
                    children: [
                      WindowsIcon(WindowsIcons.settings),
                      Text('Options'),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            spacing: spacing,
            children: [
              Expanded(
                flex: 1,
                child: Button(
                  child: Row(
                    spacing: 5,
                    children: [WindowsIcon(WindowsIcons.info), Text('About')],
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                flex: 1,
                child: Button(
                  child: Row(
                    spacing: 5,
                    children: [WindowsIcon(WindowsIcons.walk), Text('Exit')],
                  ),
                  onPressed: () {
                    windowManager.close();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

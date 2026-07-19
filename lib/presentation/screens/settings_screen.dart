import 'package:fluent_ui/fluent_ui.dart';
import 'package:memory_r/presentation/screens/screen_layout.dart';
import 'package:memory_r/presentation/widgets/info_container.dart';
import 'package:memory_r/theme/global_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: 'Options',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          spacing: 10,
          children: [
            Expanded(
              flex: 1,
              child: InfoContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    spacing: 5,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          ToggleSwitch(checked: false, onChanged: (value) {}),
                          Text(
                            'Start automatically at Windows startup',
                            style: TextStyle(fontSize: GlobalTheme.fontSize),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          ToggleSwitch(checked: false, onChanged: (value) {}),
                          Text(
                            'Hide window at startup',
                            style: TextStyle(fontSize: GlobalTheme.fontSize),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: InfoContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Checkbox(checked: false, onChanged: (value) {}),
                          Text(
                            'Set a limit to automatically optimize memory',
                            style: TextStyle(fontSize: GlobalTheme.fontSize),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Expanded(child: TextBox()),
                                SizedBox(width: 10),
                                Text(
                                  'Interval (Seconds)',
                                  style: TextStyle(
                                    fontSize: GlobalTheme.fontSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 8,
                            child: Row(
                              spacing: 5,
                              children: [
                                Expanded(
                                  child: Slider(
                                    value: 0,
                                    onChanged: (value) {},
                                  ),
                                ),
                                Text('0 %'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

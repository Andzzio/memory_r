import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/presentation/providers/settings_provider.dart';
import 'package:memory_r/presentation/screens/screen_layout.dart';
import 'package:memory_r/presentation/widgets/info_container.dart';
import 'package:memory_r/theme/global_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);
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
                          ToggleSwitch(
                            checked: settingsState.startAutomatically,
                            onChanged: (newValue) {
                              ref
                                  .read(settingsProvider.notifier)
                                  .toggleStartAutomatically();
                            },
                          ),
                          Text(
                            'Start automatically at Windows startup',
                            style: TextStyle(fontSize: GlobalTheme.fontSize),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          ToggleSwitch(
                            checked: settingsState.hideWindowAtStart,
                            onChanged: (newValue) {
                              ref
                                  .read(settingsProvider.notifier)
                                  .toggleHideWindowAtStart();
                            },
                          ),
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
                          Checkbox(
                            checked: settingsState.setLimitAuto,
                            onChanged: (newValue) {
                              ref
                                  .read(settingsProvider.notifier)
                                  .toggleSetLimitAuto();
                            },
                          ),
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
                                Expanded(
                                  child: TextBox(
                                    placeholder: '${settingsState.interval}',
                                    enabled: settingsState.setLimitAuto,
                                    onSubmitted: (newValue) {
                                      int? parsed = int.tryParse(newValue);
                                      if (parsed != null && parsed > 0) {
                                        ref
                                            .read(settingsProvider.notifier)
                                            .updateInterval(parsed);
                                      }
                                    },
                                  ),
                                ),
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
                                    value: settingsState.limitPercent
                                        .toDouble(),
                                    min: 0,
                                    max: 100,
                                    divisions: 100,
                                    onChanged: settingsState.setLimitAuto
                                        ? (newValue) {
                                            ref
                                                .read(settingsProvider.notifier)
                                                .updateLimitPercent(
                                                  newValue.toInt(),
                                                );
                                          }
                                        : null,
                                  ),
                                ),
                                Text('${settingsState.limitPercent} %'),
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

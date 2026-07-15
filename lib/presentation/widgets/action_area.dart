import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_r/presentation/providers/mem_provider.dart';
import 'package:window_manager/window_manager.dart';

class ActionArea extends ConsumerStatefulWidget {
  const ActionArea({super.key});

  @override
  ConsumerState<ActionArea> createState() => _ActionAreaState();
}

class _ActionAreaState extends ConsumerState<ActionArea> {
  bool isCleanLoading = false;
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
                  onPressed: isCleanLoading
                      ? null
                      : () async {
                          isCleanLoading = true;
                          setState(() {});
                          try {
                            await ref
                                .read(memProvider.notifier)
                                .cleanAllMemory();
                          } finally {
                            isCleanLoading = false;

                            setState(() {});
                          }
                        },
                  child: Row(
                    spacing: 5,
                    children: [
                      isCleanLoading
                          ? SizedBox(
                              width: 14,
                              height: 14,
                              child: ProgressRing(strokeWidth: 2),
                            )
                          : WindowsIcon(WindowsIcons.broom),
                      Text('Optimize'),
                    ],
                  ),
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
                  onPressed: () {
                    context.push('/settings');
                  },
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
                  onPressed: () {
                    context.push('/about');
                  },
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

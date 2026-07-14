import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/presentation/providers/mem_provider.dart';
import 'package:memory_r/presentation/widgets/action_area.dart';
import 'package:memory_r/presentation/widgets/ram_info_tile.dart';
import 'package:memory_r/presentation/widgets/info_container.dart';
import 'package:memory_r/presentation/widgets/window_buttons.dart';
import 'package:memory_r/theme/global_theme.dart';
import 'package:window_manager/window_manager.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memState = ref.watch(memProvider);
    return memState.when(
      data: (memInfo) => NavigationView(
        titleBar: TitleBar(
          icon: WindowsIcon(WindowsIcons.ram),
          title: Text('Memory R'),
          captionControls: WindowButtons(size: 10),
          onDragStarted: () {
            windowManager.startDragging();
          },
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
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
                      children: [
                        Text(
                          'Memory Information',
                          style: TextStyle(fontSize: GlobalTheme.fontSize),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Column(
                            spacing: 5,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InfoContainer(
                                  child: RamInfoTile(
                                    ramLenght: memInfo.totalMem,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InfoContainer(
                                  child: RamInfoTile(
                                    ramLenght: memInfo.usedMem,
                                    caption: 'Used Memory',
                                    icon: FluentIcons.pie_single_solid,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InfoContainer(
                                  child: RamInfoTile(
                                    ramLenght: memInfo.availableMem,
                                    caption: 'Available Memory',
                                    icon: FluentIcons.pie_single,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: InfoContainer(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Column(
                            spacing: 20,
                            children: [
                              Text(
                                'Used Memory Percentage: ${memInfo.usedPercentMem}%',
                                style: TextStyle(
                                  fontSize: GlobalTheme.fontSize,
                                ),
                              ),
                              ProgressBar(
                                value: memInfo.usedPercentMem.toDouble(),
                                strokeWidth: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 3, child: ActionArea()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Center(child: Text('Error al cargar')),
      loading: () =>
          Center(child: SizedBox(width: 50, height: 50, child: ProgressRing())),
    );
  }
}

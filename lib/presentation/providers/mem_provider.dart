import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/domain/entities/mem_info_entity.dart';
import 'package:memory_r/presentation/providers/settings_provider.dart';
import 'package:memory_r/domain/entities/app_settings.dart';
import 'package:memory_r/providers/memory_providers.dart';

class MemProvider extends StreamNotifier<MemInfoEntity> {
  Timer? _cleanTimer;
  @override
  Stream<MemInfoEntity> build() {
    _setupCleanTimer(ref.read(settingsProvider));
    final getMemInfo = ref.watch(getMemInfoUsecaseProvider);
    ref.listen(settingsProvider, (previous, next) {
      _setupCleanTimer(next);
    });
    ref.onDispose(() => _cleanTimer?.cancel());
    return Stream.periodic(
      Duration(milliseconds: 500),
      (_) => getMemInfo.call(),
    ).asyncMap((event) async => await event);
  }

  Future<void> cleanAllMemory() async {
    await ref.read(cleanAllMemoryUsecaseProvider).call();
  }

  void _setupCleanTimer(AppSettings appSettings) {
    _cleanTimer?.cancel();
    if (appSettings.setLimitAuto) {
      _cleanTimer = Timer.periodic(Duration(seconds: appSettings.interval), (
        timer,
      ) async {
        if (state.value?.usedPercentMem != null &&
            state.value!.usedPercentMem > appSettings.limitPercent) {
          await cleanAllMemory();
        }
      });
    }
  }
}

final memProvider = StreamNotifierProvider<MemProvider, MemInfoEntity>(
  MemProvider.new,
);

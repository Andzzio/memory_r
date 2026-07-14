import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/domain/entities/mem_info_entity.dart';
import 'package:memory_r/providers/memory_providers.dart';

class MemInfoProvider extends StreamNotifier<MemInfoEntity> {
  @override
  Stream<MemInfoEntity> build() {
    final getMemInfo = ref.watch(getMemInfoUsecaseProvider);
    return Stream.periodic(
      Duration(milliseconds: 500),
      (_) => getMemInfo.call(),
    ).asyncMap((event) async => await event);
  }
}

final memInfoProvider = StreamNotifierProvider<MemInfoProvider, MemInfoEntity>(
  MemInfoProvider.new,
);

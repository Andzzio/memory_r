import 'package:memory_r/core/app_logger.dart';
import 'package:memory_r/domain/repos/mem_repository.dart';

class CleanAllMemoryUsecase {
  final MemRepository repo;
  CleanAllMemoryUsecase({required this.repo});
  Future<void> call() async {
    final pIds = repo.getAllProcessesId();
    for (int i = 0; i < pIds.length; i++) {
      try {
        repo.cleanMemoryProcess(pIds[i]);
      } catch (e) {
        appLogger.w(
          'A error has ocurred in clean Memory: $e with pId: ${pIds[i]}',
        );
      }
    }
    appLogger.d('Clean All Memory Succesful');
  }
}

import 'package:memory_r/core/app_logger.dart';
import 'package:memory_r/data/datasources/win_mem_datasource.dart';
import 'package:memory_r/data/repos/win_mem_repository_impl.dart';
import 'package:memory_r/domain/repos/mem_repository.dart';
import 'package:memory_r/domain/usecases/clean_all_memory_usecase.dart';

void main() async {
  appLogger.d('Cleanup init....');
  final WinMemDatasource datasource = WinMemDatasource();
  final MemRepository repo = WinMemRepositoryImpl(datasource: datasource);

  final CleanAllMemoryUsecase usecase = CleanAllMemoryUsecase(repo: repo);
  try {
    await usecase.call();
  } catch (e) {
    appLogger.w('Error in cleanup: $e');
    return;
  }
  appLogger.d('Cleanup Finished!!!');
}

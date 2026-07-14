import 'package:memory_r/data/datasources/win_mem_datasource.dart';
import 'package:memory_r/data/models/win_mem_model.dart';
import 'package:memory_r/domain/entities/mem_info_entity.dart';
import 'package:memory_r/domain/repos/mem_repository.dart';

class WinMemRepositoryImpl implements MemRepository {
  final WinMemDatasource datasource;
  WinMemRepositoryImpl({required this.datasource});
  @override
  Future<MemInfoEntity> getMemInfo() async {
    final WinMemModel winMemModel = await datasource.fetchMem();
    return MemInfoEntity(
      totalMem: winMemModel.ullTotalPhys / (1024 * 1024 * 1024),
      availableMem: winMemModel.ullAvailPhys / (1024 * 1024 * 1024),
      usedPercentMem: winMemModel.dwMemoryLoad,
    );
  }

  @override
  List<int> getAllProcessesId() {
    return datasource.getAllProcessesId();
  }

  @override
  void cleanMemoryProcess(int id) {
    return datasource.emptyWorkingSetProcess(id);
  }
}

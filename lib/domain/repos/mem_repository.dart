import 'package:memory_r/domain/entities/mem_info_entity.dart';

abstract class MemRepository {
  Future<MemInfoEntity> getMemInfo();
  List<int> getAllProcessesId();
  void cleanMemoryProcess(int id);
}

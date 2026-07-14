import 'package:memory_r/domain/entities/mem_info_entity.dart';
import 'package:memory_r/domain/repos/mem_repository.dart';

class GetMemInfoUsecase {
  final MemRepository repository;
  GetMemInfoUsecase({required this.repository});

  Future<MemInfoEntity> call() {
    return repository.getMemInfo();
  }
}

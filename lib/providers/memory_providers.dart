import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_r/data/datasources/win_mem_datasource.dart';
import 'package:memory_r/data/repos/win_mem_repository_impl.dart';
import 'package:memory_r/domain/usecases/get_mem_info_usecase.dart';

import '../domain/repos/mem_repository.dart';

final winMemDatasourceProvider = Provider<WinMemDatasource>(
  (ref) => WinMemDatasource(),
);
final winMemRepositoryProvider = Provider<MemRepository>(
  (ref) =>
      WinMemRepositoryImpl(datasource: ref.watch(winMemDatasourceProvider)),
);

final getMemInfoUsecaseProvider = Provider<GetMemInfoUsecase>(
  (ref) => GetMemInfoUsecase(repository: ref.watch(winMemRepositoryProvider)),
);

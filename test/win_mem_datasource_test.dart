import 'package:flutter_test/flutter_test.dart';
import 'package:memory_r/core/app_logger.dart';
import 'package:memory_r/data/datasources/win_mem_datasource.dart';

void main() {
  late WinMemDatasource datasource;
  group('Clean Memory', () {
    setUp(() {
      datasource = WinMemDatasource();
    });
    test('getAllProcessesId returns at least 1 process', () {
      final pIds = datasource.getAllProcessesId();
      appLogger.d('Process Id to Test: ${pIds[40]}');
      expect(pIds, isNotEmpty);
    });
    test('Empty Working Set of 1 Process', () {
      final pIds = datasource.getAllProcessesId();
      expect(pIds, isNotEmpty, reason: 'Need at least 1 pId to test');
      expect(
        () => datasource.emptyWorkingSetProcess(pIds.last),
        returnsNormally,
      );
    });
  });
}

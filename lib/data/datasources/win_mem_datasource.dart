import 'package:ffi/ffi.dart';
import 'package:memory_r/core/app_logger.dart';
import 'dart:ffi';
import 'package:memory_r/data/models/win_mem_model.dart';
import 'package:win32/win32.dart';

class WinMemDatasource {
  WinMemModel fetchMem() {
    final status = calloc<MEMORYSTATUSEX>();
    status.ref.dwLength = sizeOf<MEMORYSTATUSEX>();
    GlobalMemoryStatusEx(status);
    try {
      return WinMemModel(
        ullTotalPhys: status.ref.ullTotalPhys,
        ullAvailPhys: status.ref.ullAvailPhys,
        dwMemoryLoad: status.ref.dwMemoryLoad,
      );
    } finally {
      calloc.free(status);
    }
  }

  List<int> getAllProcessesId() {
    List<int> processesIds = [];
    return using((arena) {
      final maxProcesses = 1024;
      final pIds = arena<Uint32>(maxProcesses);
      final countBytesNeeded = arena<Uint32>();
      final result = EnumProcesses(
        pIds,
        sizeOf<Uint32>() * maxProcesses,
        countBytesNeeded,
      );
      if (!result.value) {
        appLogger.w('Error in EnumProcesses');
        throw WindowsException(HRESULT_FROM_WIN32(result.error));
      }
      final count = countBytesNeeded.value ~/ sizeOf<Uint32>();
      for (int i = 0; i < count; i++) {
        processesIds.add(pIds[i]);
      }
      appLogger.d('ProcessesIds List finished');
      return processesIds;
    });
  }

  void emptyWorkingSetProcess(int id) {
    HANDLE? hProcess;
    try {
      final openResult = OpenProcess(
        PROCESS_SET_QUOTA | PROCESS_QUERY_LIMITED_INFORMATION,
        false,
        id,
      );
      if (openResult.value.isNull) {
        appLogger.w('Error in open Process');
        throw WindowsException(HRESULT_FROM_WIN32(openResult.error));
      }
      hProcess = openResult.value;
      final cleanResult = EmptyWorkingSet(hProcess);
      if (!cleanResult.value) {
        appLogger.w('Error in emptyWorkingSet');
        throw WindowsException(HRESULT_FROM_WIN32(cleanResult.error));
      }
      appLogger.d('Empty Working Set finished');
    } finally {
      if (hProcess != null && !hProcess.isNull) hProcess.close();
    }
  }
}

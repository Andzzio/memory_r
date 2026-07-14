class WinMemModel {
  final int ullTotalPhys;
  final int ullAvailPhys;
  final int dwMemoryLoad;
  WinMemModel({
    required this.ullTotalPhys,
    required this.ullAvailPhys,
    required this.dwMemoryLoad,
  });
}

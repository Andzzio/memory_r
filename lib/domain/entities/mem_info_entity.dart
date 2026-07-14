class MemInfoEntity {
  final double totalMem;
  final double availableMem;
  final int usedPercentMem;

  double get usedMem => totalMem - availableMem;

  MemInfoEntity({
    required this.totalMem,
    required this.availableMem,
    required this.usedPercentMem,
  });
}

enum RemainStat {
  breakSell,
  empty,
  few,
  plenty,
  some,
  unknown,
}

extension RemainStatExtension on String? {
  RemainStat toRemainStat() {
    switch (this) {
      case 'break':
        return RemainStat.breakSell;
      case 'empty':
        return RemainStat.empty;
      case 'few':
        return RemainStat.few;
      case 'plenty':
        return RemainStat.plenty;
      case 'some':
        return RemainStat.some;
      default:
        return RemainStat.unknown;
    }
  }
}
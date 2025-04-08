enum StoreRemainStat {
  plenty,
  some,
  few,
  empty,
  break_;

  String get label {
    switch (this) {
      case StoreRemainStat.plenty:
        return "넉넉함";
      case StoreRemainStat.some:
        return "적당함";
      case StoreRemainStat.few:
        return "부족함";
      case StoreRemainStat.empty:
        return "없음";
      case StoreRemainStat.break_:
        return "판매 중지";
    }
  }
}

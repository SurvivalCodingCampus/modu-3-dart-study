enum AssetType {
  stock,
  etf;

  static AssetType fromString(String value) {
    value = value.toLowerCase();
    return AssetType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => throw ArgumentError('맞는 타입이 없습니다.'),
    );
  }
}

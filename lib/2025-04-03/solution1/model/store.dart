class Store {
  final String code;
  final String name;
  final String address;
  final double lat;
  final double lng;
  final String remainStat;
  final DateTime stockAt;
  final DateTime createdAt;

  const Store({
    required this.code,
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
    required this.remainStat,
    required this.stockAt,
    required this.createdAt,
  });

  Store copyWith({
    String? code,
    String? name,
    String? address,
    double? lat,
    double? lng,
    String? remainStat,
    DateTime? stockAt,
    DateTime? createdAt,
  }) {
    return Store(
      code: code ?? this.code,
      name: name ?? this.name,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      remainStat: remainStat ?? this.remainStat,
      stockAt: stockAt ?? this.stockAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Store && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;

  @override
  String toString() {
    return 'Store{name: $name, address: $address, remainStat: $remainStat, stockAt: $stockAt}';
  }
}

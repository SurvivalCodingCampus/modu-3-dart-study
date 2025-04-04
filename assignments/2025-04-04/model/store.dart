class Store {
  final String addres;
  final String openDay;
  final double lat;
  final double lng;
  final String storeName;
  final String remainState;
  final String stockAt;

  const Store({
    required this.addres,
    required this.openDay,
    required this.lat,
    required this.lng,
    required this.storeName,
    required this.remainState,
    required this.stockAt,
  });

  Store copyWith({
    String? addres,
    String? openDay,
    double? lat,
    double? lng,
    String? storeName,
    String? remainState,
    String? stockAt,
  }) {
    return Store(
      addres: addres ?? this.addres,
      openDay: openDay ?? this.openDay,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      storeName: storeName ?? this.storeName,
      remainState: remainState ?? this.remainState,
      stockAt: stockAt ?? this.stockAt,
    );
  }

  @override
  String toString() {
    return 'Store{addres: $addres, openDay: $openDay, lat: $lat, lng: $lng, storeName: $storeName, remainState: $remainState, stockAt: $stockAt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Store &&
          runtimeType == other.runtimeType &&
          addres == other.addres &&
          openDay == other.openDay &&
          lat == other.lat &&
          lng == other.lng &&
          storeName == other.storeName &&
          remainState == other.remainState &&
          stockAt == other.stockAt;

  @override
  int get hashCode =>
      addres.hashCode ^
      openDay.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      storeName.hashCode ^
      remainState.hashCode ^
      stockAt.hashCode;
}

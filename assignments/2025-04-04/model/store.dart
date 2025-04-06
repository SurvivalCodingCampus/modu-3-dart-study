class Store {
  final String address;
  final String openDay;
  final double lat;
  final double lng;
  final String storeName;
  final String remainState;
  final String stockAt;

  const Store({
    required this.address,
    required this.openDay,
    required this.lat,
    required this.lng,
    required this.storeName,
    required this.remainState,
    required this.stockAt,
  });

  Store copyWith({
    String? address,
    String? openDay,
    double? lat,
    double? lng,
    String? storeName,
    String? remainState,
    String? stockAt,
  }) {
    return Store(
      address: address ?? this.address,
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
    return 'Store{address: $address, openDay: $openDay, lat: $lat, lng: $lng, storeName: $storeName, remainState: $remainState, stockAt: $stockAt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Store &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          openDay == other.openDay &&
          lat == other.lat &&
          lng == other.lng &&
          storeName == other.storeName &&
          remainState == other.remainState &&
          stockAt == other.stockAt;

  @override
  int get hashCode =>
      address.hashCode ^
      openDay.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      storeName.hashCode ^
      remainState.hashCode ^
      stockAt.hashCode;
}

class Geo {
  final double lat;
  final double lng;

  const Geo({required this.lat, required this.lng});

  Geo copyWith({double? lat, double? lng}) {
    return Geo(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: double.tryParse((json['lat'] as String? ?? '')) ?? 0.0,
      lng: double.tryParse((json['lng'] as String? ?? '')) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    'lat': lat.toString(),
    'lng': lng.toString(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Geo &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          lng == other.lng;

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;

  @override
  String toString() {
    return 'Geo{lat: $lat, lng: $lng}';
  }
}

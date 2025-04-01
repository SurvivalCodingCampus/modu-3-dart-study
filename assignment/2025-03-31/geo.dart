class Geo {
  double lat;
  double lng;

  Geo({required this.lat, required this.lng});

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
}
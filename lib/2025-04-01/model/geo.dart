class Geo {
  final double lat;
  final double lng;

  const Geo(this.lat, this.lng);

  Geo copyWith({double? lat, double? lng}) {
    return Geo(lat ?? this.lat, lng ?? this.lng);
  }

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
    return 'Geo(lat: $lat, lng: $lng)';
  }

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(json['lat'], json['lng']);
  }

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

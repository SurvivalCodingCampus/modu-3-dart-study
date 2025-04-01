class Geo {
  final double lat;
  final double lng;

  Geo({required this.lat, required this.lng});

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: (json['lat'] is String) ? double.parse(json['lat']) : json['lat'],
      lng: (json['lng'] is String) ? double.parse(json['lng']) : json['lng'],
    );
  }

  @override
  String toString() {
    return 'Geo{lat: $lat, lng: $lng}';
  }

  Geo copyWith({double? lat, double? lng}) {
    return Geo(lat: lat ?? this.lat, lng: lng ?? this.lng);
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
}

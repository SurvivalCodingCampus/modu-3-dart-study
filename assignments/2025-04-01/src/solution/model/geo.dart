class Geo {
  final double lat;
  final double lng;

  const Geo({required this.lat, required this.lng});

  Map<String, dynamic> toJson() {
    return {'lat': lat.toString(), 'lng': lng.toString()};
  }

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: double.parse(json['lat']), lng: double.parse(json['lng']));
  }

  @override
  String toString() {
    return '{lat: ${lat.toString()}, lng: ${lng.toString()}';
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

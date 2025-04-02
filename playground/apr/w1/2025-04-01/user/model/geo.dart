class Geo {
  final double lat;
  final double lng;

  const Geo(this.lat, this.lng);

  @override
  String toString() {
    return 'Geo{lat: $lat, lng: $lng}';
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

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(double.parse(json['lat']), double.parse(json['lng']));
  }

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

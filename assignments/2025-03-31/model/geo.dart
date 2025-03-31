class Geo {
  final double lat;
  final double lng;

  const Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    final double lat = json['lat'] == null ? 0.0 : double.parse(json['lat']);
    final double lng = json['lng'] == null ? 0.0 : double.parse(json['lng']);

    return Geo(lat: lat, lng: lng);
  }

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

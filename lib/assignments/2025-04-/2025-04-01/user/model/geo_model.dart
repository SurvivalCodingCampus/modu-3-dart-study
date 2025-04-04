class Geo {
  final double lat;
  final double lng;

  const Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    final lat = double.parse(json['lat'] as String);
    final lng = double.parse(json['lng'] as String);
    return Geo(lat: lat, lng: lng);
  }

  Map<String, dynamic> toJson() => {
    'lat':lat,
    'lng':lng,
  };
}

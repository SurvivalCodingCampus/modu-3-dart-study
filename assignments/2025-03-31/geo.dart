class Geo {
  final double lat;
  final double lng;
  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> jsonMap) {
    return Geo(
      lat: double.tryParse(jsonMap['lat']) ?? 0,
      lng: double.tryParse(jsonMap['lng']) ?? 0,
    );
  }

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';
}

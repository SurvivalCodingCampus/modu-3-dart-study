class Geolocation {
  final double latitude;
  final double longitude;

  Geolocation({required this.latitude, required this.longitude});

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      latitude: double.parse(json['lat']),
      longitude: double.parse(json['lng']),
    );
  }
}

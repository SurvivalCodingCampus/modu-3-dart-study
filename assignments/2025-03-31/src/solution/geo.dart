class Geo {
  double lat;
  double lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] == null ? 0.0 : double.parse(json['lat']),
      lng: json['lng'] == null ? 0.0 : double.parse(json['lng']),
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{lat: ${lat.toString()}, lng: ${lng.toString()}';
  }
}

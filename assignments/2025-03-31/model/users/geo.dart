class Geo {
  double lat;
  double lng;

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
}

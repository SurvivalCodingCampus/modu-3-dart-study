class Geo {
  double? lat;
  double? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: double.tryParse(json['lat']),
      lng: double.tryParse(json['lng']),
    );
  }

  @override
  String toString() {
    return 'lat : $lat, lng : $lng';
  }
}

class Geo {
  final double lat; //위도 (Latitude)
  final double lng; //경도 (Longitude)

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {

    //데이터 변경
    double latitude = double.parse(json['lat']);
    double longitude = double.parse(json['lng']);

    return Geo(
      lat: latitude,
      lng: longitude
    );
  }

  @override
  String toString() {
    return 'Geo{lat: $lat, lng: $lng}';
  }
}


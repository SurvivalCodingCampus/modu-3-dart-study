class Geo {
  final double lat;
  final double lng;

  Geo({required this.lat, required this.lng});

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: double.parse(json['lat']), lng: double.parse(json['lng']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Geo && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;

  @override
  String toString() {
    return 'lat : $lat, lng : $lng';
  }

  Geo copyWith({double? lat, double? lng}) {
    return Geo(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }
}

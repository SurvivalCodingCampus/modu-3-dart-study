import 'dart:convert';

class Geo {
  final double lat;
  final double lng;
  Geo({
    required this.lat,
    required this.lng,
  });

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  Geo copyWith({
    double? lat,
    double? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: double.tryParse(map['lat']) ?? 0,
      lng: double.tryParse(map['lng']) ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) => Geo.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Geo &&
      other.lat == lat &&
      other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

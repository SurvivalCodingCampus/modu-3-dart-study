import 'geo.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String? ?? '',
      suite: json['suite'] as String? ?? '',
      city: json['city'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      geo:
          json['geo'] != null
              ? Geo.fromJson(json['geo'] as Map<String, dynamic>)
              : Geo(lat: 0.0, lng: 0.0),
    );
  }

  Map<String, dynamic> toJson() => {
    'street': street,
    'suite': suite,
    'city': city,
    'zipcode': zipcode,
    'geo': geo.toJson(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          street == other.street &&
          suite == other.suite &&
          city == other.city &&
          zipcode == other.zipcode &&
          geo == other.geo;

  @override
  int get hashCode =>
      street.hashCode ^
      suite.hashCode ^
      city.hashCode ^
      zipcode.hashCode ^
      geo.hashCode;
}

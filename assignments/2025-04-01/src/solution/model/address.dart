import 'geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipCode,
    required this.geo,
  });

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipCode,
      'geo': geo.toJson(),
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipCode: json['zipcode'] as String,
      geo: Geo.fromJson(json['geo']),
    );
  }

  @override
  String toString() {
    return '{street: $street, suite: $suite, city: $city, geo: $geo}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          street == other.street &&
          suite == other.suite &&
          city == other.city &&
          zipCode == other.zipCode &&
          geo == other.geo;

  @override
  int get hashCode =>
      street.hashCode ^
      suite.hashCode ^
      city.hashCode ^
      zipCode.hashCode ^
      geo.hashCode;
}

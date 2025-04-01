import 'geo.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipCode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipCode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] ?? '',
      suite: json['suite'] ?? '',
      city: json['city'] ?? '',
      zipCode: json['zipcode'] ?? '',
      geo: Geo.fromJson(json['geo']),
    );
  }

  @override
  String toString() {
    return '{street: $street, suite: $suite, city: $city, geo: $geo}';
  }
}

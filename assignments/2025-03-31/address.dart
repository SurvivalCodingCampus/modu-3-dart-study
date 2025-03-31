import 'geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> jsonMap) {
    return Address(
      street: jsonMap['street'] ?? '',
      suite: jsonMap['suite'] ?? '',
      city: jsonMap['city'] ?? '',
      zipcode: jsonMap['zipcode'] ?? '',
      geo: Geo.fromJson(jsonMap['geo']),
    );
  }
}

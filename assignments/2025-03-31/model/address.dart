import 'geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo? geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json['street'] ?? '',
    suite: json['suite'] ?? '',
    city: json['city'] ?? '',
    zipcode: json['zipcode'] ?? '',
    geo: json['geo'] == null ? null : Geo.fromJson(json['geo']),
  );

  Map<String, dynamic> toJson() => {
    'street': street,
    'suite': suite,
    'city': city,
    'zipcode': zipcode,
    'geo': geo?.toJson(),
  };
}

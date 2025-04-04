import 'geo_model.dart';

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

  factory Address.fromJson(Map<String, dynamic> json) {
    final street = json['street'] as String;
    final suite = json['suite'] as String;
    final city = json['city'] as String;
    final zipcode = json['zipcode'] as String;
    final geo = Geo.fromJson(json['geo'] as Map<String, dynamic>);
    return Address(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geo,
    );
  }
}

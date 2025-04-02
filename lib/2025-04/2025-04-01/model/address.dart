import 'package:modu_3_dart_study/2025-04/2025-04-01/model/geolocation.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geolocation geolocation;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geolocation,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geolocation: Geolocation.fromJson(json['geo']),
    );
  }
}

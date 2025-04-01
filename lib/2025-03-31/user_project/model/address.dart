import 'package:modu_3_dart_study/2025-03-31/user_project/model/geo.dart';

class Address {
  final String street; //거리
  final String suite; //상세주소 (호실, 방번호, 사무실 번호)
  final String city; // 도시
  final String zipcode; // 우편번호
  final Geo geo; //지리정보

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: Geo.fromJson(json['geo'])
    );
  }

  @override
  String toString() {
    return 'Address{street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo}';
  }


}


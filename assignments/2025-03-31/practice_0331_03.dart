// https://maybe-developer.tistory.com/64 참고
import 'dart:convert';
import 'dart:io';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}

class UserData implements UserDataSource {
  final String filePath;
  UserData(this.filePath);
  @override
  Future<List<User>> getUsers() async {
    final file = File(filePath);
    final jsonString = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((e) => User.fromJson(e)).toList();
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final Geo geo;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.geo,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      address: Address.fromJson(json['address']),
      geo: Geo.fromJson(json['address']['geo']),
      phone: json['phone'] ?? '',
    );
  }
  @override
  String toString() {
    return 'User(id: $id, name: $name,email: $email,address: $address,geo: $geo,phone: $phone)';
  }
}

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
    return Address(
      street: json['street'] ?? '',
      suite: json['suite'] ?? '',
      city: json['city'] ?? '',
      zipcode: json['zipcode'] ?? '',
      geo: Geo.fromJson(json['geo']),
    );
  }

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }
}

class Geo {
  final double lat;
  final double lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: double.parse(json['lat']), lng: double.parse(json['lng']));
  }
  @override
  String toString() {
    return 'Geo(lat: $lat, lng: $lng)';
  }
}

void main() async {
  final dataSource = UserData(
    '/Users/hemu/dev/DartProject/modu-3-dart-study/lib/data_source/userdata_source.json',
  );
  final user = await dataSource.getUsers();
  print(user);
}

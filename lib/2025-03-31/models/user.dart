import 'package:modu_3_dart_study/2025-03-31/models/address.dart';
import 'package:modu_3_dart_study/2025-03-31/models/company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.company,
    required this.phone,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      website: json['website'],
    );
  }
}

import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address? address;
  final String phone;
  final String website;
  final Company? company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.address,
    required this.phone,
    required this.website,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    username: json['username'] ?? '',
    email: json['email'] ?? '',
    address: json['address'] != null ? Address.fromJson(json['address']) : null,
    phone: json['phone'] ?? '',
    website: json['website'] ?? '',
    company: json['company'] != null ? Company.fromJson(json['company']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'address': address?.toJson(),
    'phone': phone,
    'website': website,
    'company': company?.toJson(),
  };
}

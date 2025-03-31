import 'address.dart';
import 'company.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
  factory User.fromJson(Map<String, dynamic> jsonMap) {
    return User(
      id: jsonMap['id'] ?? 0,
      name: jsonMap['name'] ?? '',
      username: jsonMap['username'] ?? '',
      email: jsonMap['email'] ?? '',
      address: Address.fromJson(jsonMap['address']),
      phone: jsonMap['phone'] ?? '',
      website: jsonMap['website'] ?? '',
      company: Company.fromJson(jsonMap['company']),
    );
  }
}
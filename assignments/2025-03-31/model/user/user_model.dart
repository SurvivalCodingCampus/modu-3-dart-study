import 'address_model.dart';
import 'company_model.dart';

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
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final name = json['name'] as String;
    final username = json['username'] as String;
    final email = json['email'] as String;
    final phone = json['phone'] as String;
    final website = json['website'] as String;
    final address = Address.fromJson(json['address'] as Map<String, dynamic>);
    final company = Company.fromJson(json['company'] as Map<String, dynamic>);
    return User(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address,
      phone: phone,
      website: website,
      company: company,
    );
  }
}

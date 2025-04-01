// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'address.dart';
import 'company.dart';

class User {
  int id;
  String name;
  String userName;
  String email;
  Address address;
  String phone;
  String webSite;
  Company company;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
    required this.phone,
    required this.webSite,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      userName: json['username'] ?? '',
      email: json['email'] ?? '',
      address: Address.fromJson(json['address']),
      phone: json['phone'] ?? '',
      webSite: json['website'] ?? '',
      company: Company.fromJson(json['company']),
    );
  }

  @override
  String toString() {
    return '{id: $id, name: $name, username: $userName, email: $email, address: $address, phone: $phone, website: $webSite, company: $company}';
  }
}

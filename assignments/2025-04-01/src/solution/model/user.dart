// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;
  final String phone;
  final String webSite;
  final Company company;

  const User({
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
      id: json['id'] as int,
      name: json['name'] as String,
      userName: json['username'] as String,
      email: json['email'] as String,
      address: Address.fromJson(json['address']),
      phone: json['phone'] as String,
      webSite: json['website'] as String,
      company: Company.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': userName,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'website': webSite,
      'company': company.toJson(),
    };
  }

  @override
  String toString() {
    return '{id: $id, name: $name, username: $userName, email: $email, address: $address, phone: $phone, website: $webSite, company: $company}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          userName == other.userName &&
          email == other.email &&
          address == other.address &&
          phone == other.phone &&
          webSite == other.webSite &&
          company == other.company;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      userName.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      webSite.hashCode ^
      company.hashCode;

  User copyWith({
    int? id,
    String? name,
    String? userName,
    String? email,
    Address? address,
    String? phone,
    String? webSite,
    Company? company,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      webSite: webSite ?? this.webSite,
      company: company ?? this.company,
    );
  }
}

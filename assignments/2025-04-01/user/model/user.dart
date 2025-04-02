import '../../../2025-03-31/model/address.dart';
import '../../../2025-03-31/model/company.dart';
import '../../utils/json_convertible.dart';

class User implements JsonConvertible<User, int> {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address? address;
  final String phone;
  final String website;
  final Company? company;

  const User({
    int? id,
    String? name,
    String? username,
    String? email,
    this.address,
    String? phone,
    String? website,
    this.company,
  }) : id = id ?? 0,
       name = name ?? '',
       username = username ?? '',
       email = email ?? '',
       phone = phone ?? '',
       website = website ?? '';

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'User{id: $id, name: $name, userName: $username}';
  }

  @override
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

  @override
  // TODO: implement filterKey
  int get filterKey => id;

  @override
  User fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }
}

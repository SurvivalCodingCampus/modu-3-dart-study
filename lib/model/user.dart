import 'company.dart';
import 'geo.dart';
import 'address.dart';


class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final Geo geo;
  final String phone;
  final String website;
  final Company company;

  User(
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.geo,
    this.phone,
    this.website,
    this.company,
  );

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    Geo? geo,
    String? phone,
    String? website,
    Company? company,
  }) {
    return User(
      id ?? this.id,
      name ?? this.name,
      username ?? this.username,
      email ?? this.email,
      address ?? this.address,
      geo ?? this.geo,
      phone ?? this.phone,
      website ?? this.website,
      company ?? this.company,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          email == other.email &&
          address == other.address &&
          geo == other.geo &&
          phone == other.phone &&
          website == other.website &&
          company == other.company;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      address.hashCode ^
      geo.hashCode ^
      phone.hashCode ^
      website.hashCode ^
      company.hashCode;

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, address: $address, geo: $geo, phone: $phone, website: $website, company: $company}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['username'],
      json['email'],
      json['address'],
      json['geo'],
      json['phone'],
      json['website'],
      json['company'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'address': address,
    'geo': geo,
    'phone': phone,
    'website': website,
    'company': company,
  };
}

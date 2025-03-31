import 'package:modu_3_dart_study/2025-03-31/user_project/model/address.dart';
import 'package:modu_3_dart_study/2025-03-31/user_project/model/company.dart';

class User {
  final int id; //사용자 ID
  final String name; //이름
  final String username; //닉네임일 듯
  final String email; //이메일
  final Address address; //주소
  final String phone; //전화 번호
  final String website; //웹 사이트
  final Company company; //회사 정보

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
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company}';
  }
}

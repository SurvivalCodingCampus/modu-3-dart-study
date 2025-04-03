import 'dart:convert';

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> map) {
    return Company(
      name: map['name'] ?? '',
      catchPhrase: map['catchPhrase'] ?? '',
      bs: map['bs'] ?? '',
    );
  }

  @override
  String toString() =>
      'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
}

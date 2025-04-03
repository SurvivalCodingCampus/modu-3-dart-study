import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

void main() async {
  Person(name: '이지롱', age: 20);
}

@JsonSerializable()
class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

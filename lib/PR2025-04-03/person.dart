import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

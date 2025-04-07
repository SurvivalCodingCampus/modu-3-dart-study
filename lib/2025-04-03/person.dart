import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {
  final String name;
  final int age;

  Person({
    required this.name,
    required this.age,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

}
import 'package:json_annotation/json_annotation.dart';

part 'json_serializable.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {
  @JsonKey(name: 'nam')
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}


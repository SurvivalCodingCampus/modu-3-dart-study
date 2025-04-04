// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) =>
    Person(name: json['nam'] as String, age: (json['age'] as num).toInt());

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'nam': instance.name,
  'age': instance.age,
};

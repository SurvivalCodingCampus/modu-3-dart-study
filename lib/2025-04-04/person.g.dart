// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Person _$PersonFromJson(Map<String, dynamic> json) =>
    _Person(name: json['name'] as String, age: (json['age'] as num).toInt());

Map<String, dynamic> _$PersonToJson(_Person instance) => <String, dynamic>{
  'name': instance.name,
  'age': instance.age,
};

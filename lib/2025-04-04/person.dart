import 'package:freezed_annotation/freezed_annotation.dart';

//ptf
part 'person.freezed.dart';

//pts
part 'person.g.dart';

//fdataclass
@freezed
abstract class Person with _$Person {
  
  const factory Person({required String name, required int age}) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}


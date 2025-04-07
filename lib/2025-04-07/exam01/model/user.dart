import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  String? id;
  final String email;
  final String password;
  DateTime? createdAt;

  User({this.id, required this.email, required this.password, this.createdAt});
}

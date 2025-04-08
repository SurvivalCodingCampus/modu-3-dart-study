// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

  String get id;

  String get email;

  String get password;

  DateTime get createdAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }


  @override
  int get hashCode => Object.hash(runtimeType, id, email, password, createdAt);

  @override
  String toString() {
    return 'User(id: $id, email: $email, password: $password, createdAt: $createdAt)';
  }


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value,
      $Res Function(User) _then) = _$UserCopyWithImpl;

  @useResult
  $Res call({
    String id, String email, String password, DateTime createdAt
  });


}

/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? id = null, Object? email = null, Object? password = null, Object? createdAt = null,}) {
    return _then(User(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
      as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
      as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
      as DateTime,
    ));
  }

}


// dart format on

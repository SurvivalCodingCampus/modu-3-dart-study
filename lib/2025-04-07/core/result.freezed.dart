// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Result<S,F> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<S, F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Result<$S, $F>()';
}


}

/// @nodoc
class $ResultCopyWith<S,F,$Res>  {
$ResultCopyWith(Result<S, F> _, $Res Function(Result<S, F>) __);
}


/// @nodoc


class Success<S,F> implements Result<S, F> {
  const Success(this.value);
  

 final  S value;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<S, F, Success<S, F>> get copyWith => _$SuccessCopyWithImpl<S, F, Success<S, F>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<S, F>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Result<$S, $F>.success(value: $value)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<S,F,$Res> implements $ResultCopyWith<S, F, $Res> {
  factory $SuccessCopyWith(Success<S, F> value, $Res Function(Success<S, F>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 S value
});




}
/// @nodoc
class _$SuccessCopyWithImpl<S,F,$Res>
    implements $SuccessCopyWith<S, F, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<S, F> _self;
  final $Res Function(Success<S, F>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(Success<S, F>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as S,
  ));
}


}

/// @nodoc


class Error<S,F> implements Result<S, F> {
  const Error(this.error);
  

 final  F error;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<S, F, Error<S, F>> get copyWith => _$ErrorCopyWithImpl<S, F, Error<S, F>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<S, F>&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'Result<$S, $F>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<S,F,$Res> implements $ResultCopyWith<S, F, $Res> {
  factory $ErrorCopyWith(Error<S, F> value, $Res Function(Error<S, F>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 F error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<S,F,$Res>
    implements $ErrorCopyWith<S, F, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<S, F> _self;
  final $Res Function(Error<S, F>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(Error<S, F>(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as F,
  ));
}


}

// dart format on

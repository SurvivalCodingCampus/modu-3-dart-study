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
mixin _$Result<D,E> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<D, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Result<$D, $E>()';
}


}

/// @nodoc
class $ResultCopyWith<D,E,$Res>  {
$ResultCopyWith(Result<D, E> _, $Res Function(Result<D, E>) __);
}


/// @nodoc


class Success<D,E> implements Result<D, E> {
   Success(this.data);
  

 final  D data;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<D, E, Success<D, E>> get copyWith => _$SuccessCopyWithImpl<D, E, Success<D, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<D, E>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Result<$D, $E>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<D,E,$Res> implements $ResultCopyWith<D, E, $Res> {
  factory $SuccessCopyWith(Success<D, E> value, $Res Function(Success<D, E>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 D data
});




}
/// @nodoc
class _$SuccessCopyWithImpl<D,E,$Res>
    implements $SuccessCopyWith<D, E, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<D, E> _self;
  final $Res Function(Success<D, E>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Success<D, E>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as D,
  ));
}


}

/// @nodoc


class Error<D,E> implements Result<D, E> {
   Error(this.error);
  

 final  E error;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<D, E, Error<D, E>> get copyWith => _$ErrorCopyWithImpl<D, E, Error<D, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<D, E>&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'Result<$D, $E>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<D,E,$Res> implements $ResultCopyWith<D, E, $Res> {
  factory $ErrorCopyWith(Error<D, E> value, $Res Function(Error<D, E>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 E error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<D,E,$Res>
    implements $ErrorCopyWith<D, E, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<D, E> _self;
  final $Res Function(Error<D, E>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(Error<D, E>(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as E,
  ));
}


}

// dart format on

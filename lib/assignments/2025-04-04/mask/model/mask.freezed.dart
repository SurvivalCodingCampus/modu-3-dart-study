// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Mask {

 String get name; String get address; String get remainStat; DateTime get stockAt; DateTime get createdAt; double get lat; double get lng; int get code;
/// Create a copy of Mask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaskCopyWith<Mask> get copyWith => _$MaskCopyWithImpl<Mask>(this as Mask, _$identity);

  /// Serializes this Mask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Mask&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,remainStat,stockAt,createdAt,lat,lng,code);

@override
String toString() {
  return 'Mask(name: $name, address: $address, remainStat: $remainStat, stockAt: $stockAt, createdAt: $createdAt, lat: $lat, lng: $lng, code: $code)';
}


}

/// @nodoc
abstract mixin class $MaskCopyWith<$Res>  {
  factory $MaskCopyWith(Mask value, $Res Function(Mask) _then) = _$MaskCopyWithImpl;
@useResult
$Res call({
 String name, String address, String remainStat, DateTime stockAt, DateTime createdAt, double lat, double lng, int code
});




}
/// @nodoc
class _$MaskCopyWithImpl<$Res>
    implements $MaskCopyWith<$Res> {
  _$MaskCopyWithImpl(this._self, this._then);

  final Mask _self;
  final $Res Function(Mask) _then;

/// Create a copy of Mask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = null,Object? remainStat = null,Object? stockAt = null,Object? createdAt = null,Object? lat = null,Object? lng = null,Object? code = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,remainStat: null == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as String,stockAt: null == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Mask implements Mask {
  const _Mask({required this.name, required this.address, required this.remainStat, required this.stockAt, required this.createdAt, required this.lat, required this.lng, required this.code});
  factory _Mask.fromJson(Map<String, dynamic> json) => _$MaskFromJson(json);

@override final  String name;
@override final  String address;
@override final  String remainStat;
@override final  DateTime stockAt;
@override final  DateTime createdAt;
@override final  double lat;
@override final  double lng;
@override final  int code;

/// Create a copy of Mask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaskCopyWith<_Mask> get copyWith => __$MaskCopyWithImpl<_Mask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mask&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,remainStat,stockAt,createdAt,lat,lng,code);

@override
String toString() {
  return 'Mask(name: $name, address: $address, remainStat: $remainStat, stockAt: $stockAt, createdAt: $createdAt, lat: $lat, lng: $lng, code: $code)';
}


}

/// @nodoc
abstract mixin class _$MaskCopyWith<$Res> implements $MaskCopyWith<$Res> {
  factory _$MaskCopyWith(_Mask value, $Res Function(_Mask) _then) = __$MaskCopyWithImpl;
@override @useResult
$Res call({
 String name, String address, String remainStat, DateTime stockAt, DateTime createdAt, double lat, double lng, int code
});




}
/// @nodoc
class __$MaskCopyWithImpl<$Res>
    implements _$MaskCopyWith<$Res> {
  __$MaskCopyWithImpl(this._self, this._then);

  final _Mask _self;
  final $Res Function(_Mask) _then;

/// Create a copy of Mask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = null,Object? remainStat = null,Object? stockAt = null,Object? createdAt = null,Object? lat = null,Object? lng = null,Object? code = null,}) {
  return _then(_Mask(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,remainStat: null == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as String,stockAt: null == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

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

 String get name;// 약국 이름
 String get address;// 주소
 double get latitude;// 위도
 double get longitude;// 경도
 String get remainStatus;// 재고 상태
 DateTime get stockAt;// 마지막 입고 시각
 DateTime get createdAt;
/// Create a copy of Mask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaskCopyWith<Mask> get copyWith => _$MaskCopyWithImpl<Mask>(this as Mask, _$identity);

  /// Serializes this Mask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Mask&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.remainStatus, remainStatus) || other.remainStatus == remainStatus)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,latitude,longitude,remainStatus,stockAt,createdAt);

@override
String toString() {
  return 'Mask(name: $name, address: $address, latitude: $latitude, longitude: $longitude, remainStatus: $remainStatus, stockAt: $stockAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MaskCopyWith<$Res>  {
  factory $MaskCopyWith(Mask value, $Res Function(Mask) _then) = _$MaskCopyWithImpl;
@useResult
$Res call({
 String name, String address, double latitude, double longitude, String remainStatus, DateTime stockAt, DateTime createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? remainStatus = null,Object? stockAt = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,remainStatus: null == remainStatus ? _self.remainStatus : remainStatus // ignore: cast_nullable_to_non_nullable
as String,stockAt: null == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Mask implements Mask {
  const _Mask({required this.name, required this.address, required this.latitude, required this.longitude, required this.remainStatus, required this.stockAt, required this.createdAt});
  factory _Mask.fromJson(Map<String, dynamic> json) => _$MaskFromJson(json);

@override final  String name;
// 약국 이름
@override final  String address;
// 주소
@override final  double latitude;
// 위도
@override final  double longitude;
// 경도
@override final  String remainStatus;
// 재고 상태
@override final  DateTime stockAt;
// 마지막 입고 시각
@override final  DateTime createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mask&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.remainStatus, remainStatus) || other.remainStatus == remainStatus)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,latitude,longitude,remainStatus,stockAt,createdAt);

@override
String toString() {
  return 'Mask(name: $name, address: $address, latitude: $latitude, longitude: $longitude, remainStatus: $remainStatus, stockAt: $stockAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MaskCopyWith<$Res> implements $MaskCopyWith<$Res> {
  factory _$MaskCopyWith(_Mask value, $Res Function(_Mask) _then) = __$MaskCopyWithImpl;
@override @useResult
$Res call({
 String name, String address, double latitude, double longitude, String remainStatus, DateTime stockAt, DateTime createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? remainStatus = null,Object? stockAt = null,Object? createdAt = null,}) {
  return _then(_Mask(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,remainStatus: null == remainStatus ? _self.remainStatus : remainStatus // ignore: cast_nullable_to_non_nullable
as String,stockAt: null == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

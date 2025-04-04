// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Store {

 String? get addr; String? get code; double? get lat; double? get lng; String? get name; String? get remainStat; String? get stockAt;
/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreCopyWith<Store> get copyWith => _$StoreCopyWithImpl<Store>(this as Store, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Store&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.code, code) || other.code == code)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt));
}


@override
int get hashCode => Object.hash(runtimeType,addr,code,lat,lng,name,remainStat,stockAt);

@override
String toString() {
  return 'Store(addr: $addr, code: $code, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt)';
}


}

/// @nodoc
abstract mixin class $StoreCopyWith<$Res>  {
  factory $StoreCopyWith(Store value, $Res Function(Store) _then) = _$StoreCopyWithImpl;
@useResult
$Res call({
 String? addr, String? code, double? lat, double? lng, String? name, String? remainStat, String? stockAt
});




}
/// @nodoc
class _$StoreCopyWithImpl<$Res>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._self, this._then);

  final Store _self;
  final $Res Function(Store) _then;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addr = freezed,Object? code = freezed,Object? lat = freezed,Object? lng = freezed,Object? name = freezed,Object? remainStat = freezed,Object? stockAt = freezed,}) {
  return _then(_self.copyWith(
addr: freezed == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,remainStat: freezed == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as String?,stockAt: freezed == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _Store implements Store {
  const _Store({this.addr, this.code, this.lat, this.lng, this.name, this.remainStat, this.stockAt});
  

@override final  String? addr;
@override final  String? code;
@override final  double? lat;
@override final  double? lng;
@override final  String? name;
@override final  String? remainStat;
@override final  String? stockAt;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreCopyWith<_Store> get copyWith => __$StoreCopyWithImpl<_Store>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Store&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.code, code) || other.code == code)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt));
}


@override
int get hashCode => Object.hash(runtimeType,addr,code,lat,lng,name,remainStat,stockAt);

@override
String toString() {
  return 'Store(addr: $addr, code: $code, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt)';
}


}

/// @nodoc
abstract mixin class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) _then) = __$StoreCopyWithImpl;
@override @useResult
$Res call({
 String? addr, String? code, double? lat, double? lng, String? name, String? remainStat, String? stockAt
});




}
/// @nodoc
class __$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(this._self, this._then);

  final _Store _self;
  final $Res Function(_Store) _then;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addr = freezed,Object? code = freezed,Object? lat = freezed,Object? lng = freezed,Object? name = freezed,Object? remainStat = freezed,Object? stockAt = freezed,}) {
  return _then(_Store(
addr: freezed == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,remainStat: freezed == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as String?,stockAt: freezed == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

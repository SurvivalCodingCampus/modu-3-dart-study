// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stores.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Stores {

 String get addr; String get code; DateTime get createdAt; num get lat; num get lng; String get name; String get remainState; DateTime get stockAt; String get type;
/// Create a copy of Stores
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoresCopyWith<Stores> get copyWith => _$StoresCopyWithImpl<Stores>(this as Stores, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stores&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name)&&(identical(other.remainState, remainState) || other.remainState == remainState)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,addr,code,createdAt,lat,lng,name,remainState,stockAt,type);

@override
String toString() {
  return 'Stores(addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainState: $remainState, stockAt: $stockAt, type: $type)';
}


}

/// @nodoc
abstract mixin class $StoresCopyWith<$Res>  {
  factory $StoresCopyWith(Stores value, $Res Function(Stores) _then) = _$StoresCopyWithImpl;
@useResult
$Res call({
 String addr, String code, DateTime createdAt, num lat, num lng, String name, String remainState, DateTime stockAt, String type
});




}
/// @nodoc
class _$StoresCopyWithImpl<$Res>
    implements $StoresCopyWith<$Res> {
  _$StoresCopyWithImpl(this._self, this._then);

  final Stores _self;
  final $Res Function(Stores) _then;

/// Create a copy of Stores
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addr = null,Object? code = null,Object? createdAt = null,Object? lat = null,Object? lng = null,Object? name = null,Object? remainState = null,Object? stockAt = null,Object? type = null,}) {
  return _then(Stores(
addr: null == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as num,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as num,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,remainState: null == remainState ? _self.remainState : remainState // ignore: cast_nullable_to_non_nullable
as String,stockAt: null == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on

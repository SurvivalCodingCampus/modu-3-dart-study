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

 String get addres; String get openDay; double get lat; double get lng; String get storeName; String get remainState; String get stockAt;
/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreCopyWith<Store> get copyWith => _$StoreCopyWithImpl<Store>(this as Store, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Store&&(identical(other.addres, addres) || other.addres == addres)&&(identical(other.openDay, openDay) || other.openDay == openDay)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.remainState, remainState) || other.remainState == remainState)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt));
}


@override
int get hashCode => Object.hash(runtimeType,addres,openDay,lat,lng,storeName,remainState,stockAt);

@override
String toString() {
  return 'Store(addres: $addres, openDay: $openDay, lat: $lat, lng: $lng, storeName: $storeName, remainState: $remainState, stockAt: $stockAt)';
}


}

/// @nodoc
abstract mixin class $StoreCopyWith<$Res>  {
  factory $StoreCopyWith(Store value, $Res Function(Store) _then) = _$StoreCopyWithImpl;
@useResult
$Res call({
 String addres, String openDay, double lat, double lng, String storeName, String remainState, String stockAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? addres = null,Object? openDay = null,Object? lat = null,Object? lng = null,Object? storeName = null,Object? remainState = null,Object? stockAt = null,}) {
  return _then(Store(
addres: null == addres ? _self.addres : addres // ignore: cast_nullable_to_non_nullable
as String,openDay: null == openDay ? _self.openDay : openDay // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,remainState: null == remainState ? _self.remainState : remainState // ignore: cast_nullable_to_non_nullable
as String,stockAt: null == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on

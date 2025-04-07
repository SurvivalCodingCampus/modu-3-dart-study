// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mask_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaskStore {

 String get address; String get name; String get remainStat; int get code; DateTime? get stockAt; set stockAt(DateTime? value); DateTime? get createdAt; set createdAt(DateTime? value);
/// Create a copy of MaskStore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaskStoreCopyWith<MaskStore> get copyWith => _$MaskStoreCopyWithImpl<MaskStore>(this as MaskStore, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaskStore&&(identical(other.address, address) || other.address == address)&&(identical(other.name, name) || other.name == name)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.code, code) || other.code == code)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,address,name,remainStat,code,stockAt,createdAt);

@override
String toString() {
  return 'MaskStore(address: $address, name: $name, remainStat: $remainStat, code: $code, stockAt: $stockAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MaskStoreCopyWith<$Res>  {
  factory $MaskStoreCopyWith(MaskStore value, $Res Function(MaskStore) _then) = _$MaskStoreCopyWithImpl;
@useResult
$Res call({
 String address, String name, String remainStat, int code, DateTime? stockAt, DateTime? createdAt
});




}
/// @nodoc
class _$MaskStoreCopyWithImpl<$Res>
    implements $MaskStoreCopyWith<$Res> {
  _$MaskStoreCopyWithImpl(this._self, this._then);

  final MaskStore _self;
  final $Res Function(MaskStore) _then;

/// Create a copy of MaskStore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? name = null,Object? remainStat = null,Object? code = null,Object? stockAt = freezed,Object? createdAt = freezed,}) {
  return _then(MaskStore(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,remainStat: null == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,stockAt: freezed == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


// dart format on

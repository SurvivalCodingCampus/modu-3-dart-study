// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoDto {

 dynamic get id; String? get type; String? get title; String? get content; String? get url; String? get caption;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of PhotoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoDtoCopyWith<PhotoDto> get copyWith => _$PhotoDtoCopyWithImpl<PhotoDto>(this as PhotoDto, _$identity);

  /// Serializes this PhotoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoDto&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.url, url) || other.url == url)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),type,title,content,url,caption,createdAt);

@override
String toString() {
  return 'PhotoDto(id: $id, type: $type, title: $title, content: $content, url: $url, caption: $caption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PhotoDtoCopyWith<$Res>  {
  factory $PhotoDtoCopyWith(PhotoDto value, $Res Function(PhotoDto) _then) = _$PhotoDtoCopyWithImpl;
@useResult
$Res call({
 dynamic id, String? type, String? title, String? content, String? url, String? caption,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class _$PhotoDtoCopyWithImpl<$Res>
    implements $PhotoDtoCopyWith<$Res> {
  _$PhotoDtoCopyWithImpl(this._self, this._then);

  final PhotoDto _self;
  final $Res Function(PhotoDto) _then;

/// Create a copy of PhotoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = freezed,Object? title = freezed,Object? content = freezed,Object? url = freezed,Object? caption = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PhotoDto implements PhotoDto {
  const _PhotoDto({this.id, this.type, this.title, this.content, this.url, this.caption, @JsonKey(name: "created_at") this.createdAt});
  factory _PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);

@override final  dynamic id;
@override final  String? type;
@override final  String? title;
@override final  String? content;
@override final  String? url;
@override final  String? caption;
@override@JsonKey(name: "created_at") final  String? createdAt;

/// Create a copy of PhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoDtoCopyWith<_PhotoDto> get copyWith => __$PhotoDtoCopyWithImpl<_PhotoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoDto&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.url, url) || other.url == url)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),type,title,content,url,caption,createdAt);

@override
String toString() {
  return 'PhotoDto(id: $id, type: $type, title: $title, content: $content, url: $url, caption: $caption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PhotoDtoCopyWith<$Res> implements $PhotoDtoCopyWith<$Res> {
  factory _$PhotoDtoCopyWith(_PhotoDto value, $Res Function(_PhotoDto) _then) = __$PhotoDtoCopyWithImpl;
@override @useResult
$Res call({
 dynamic id, String? type, String? title, String? content, String? url, String? caption,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class __$PhotoDtoCopyWithImpl<$Res>
    implements _$PhotoDtoCopyWith<$Res> {
  __$PhotoDtoCopyWithImpl(this._self, this._then);

  final _PhotoDto _self;
  final $Res Function(_PhotoDto) _then;

/// Create a copy of PhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = freezed,Object? title = freezed,Object? content = freezed,Object? url = freezed,Object? caption = freezed,Object? createdAt = freezed,}) {
  return _then(_PhotoDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

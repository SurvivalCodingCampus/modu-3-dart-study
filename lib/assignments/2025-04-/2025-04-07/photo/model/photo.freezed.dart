// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Photo {

 List<String> get tags; String get previewURL;
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoCopyWith<Photo> get copyWith => _$PhotoCopyWithImpl<Photo>(this as Photo, _$identity);

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Photo&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.previewURL, previewURL) || other.previewURL == previewURL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tags),previewURL);

@override
String toString() {
  return 'Photo(tags: $tags, previewURL: $previewURL)';
}


}

/// @nodoc
abstract mixin class $PhotoCopyWith<$Res>  {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) _then) = _$PhotoCopyWithImpl;
@useResult
$Res call({
 List<String> tags, String previewURL
});




}
/// @nodoc
class _$PhotoCopyWithImpl<$Res>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._self, this._then);

  final Photo _self;
  final $Res Function(Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tags = null,Object? previewURL = null,}) {
  return _then(_self.copyWith(
tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,previewURL: null == previewURL ? _self.previewURL : previewURL // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Photo implements Photo {
  const _Photo({required final  List<String> tags, required this.previewURL}): _tags = tags;
  factory _Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String previewURL;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoCopyWith<_Photo> get copyWith => __$PhotoCopyWithImpl<_Photo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Photo&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.previewURL, previewURL) || other.previewURL == previewURL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags),previewURL);

@override
String toString() {
  return 'Photo(tags: $tags, previewURL: $previewURL)';
}


}

/// @nodoc
abstract mixin class _$PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) _then) = __$PhotoCopyWithImpl;
@override @useResult
$Res call({
 List<String> tags, String previewURL
});




}
/// @nodoc
class __$PhotoCopyWithImpl<$Res>
    implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(this._self, this._then);

  final _Photo _self;
  final $Res Function(_Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tags = null,Object? previewURL = null,}) {
  return _then(_Photo(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,previewURL: null == previewURL ? _self.previewURL : previewURL // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

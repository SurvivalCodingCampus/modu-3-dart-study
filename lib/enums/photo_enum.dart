import 'package:freezed_annotation/freezed_annotation.dart';

enum PhotoEnum {
  @JsonValue('article')
  article,
  @JsonValue('image')
  image,
  @JsonValue('video')
  video,
  @JsonValue('unknown')
  unknown,
}

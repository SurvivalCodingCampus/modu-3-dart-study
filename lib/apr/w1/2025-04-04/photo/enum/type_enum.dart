import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum PhotoType {
  @JsonValue('article')
  Article,
  @JsonValue('image')
  Image,
  @JsonValue('video')
  Video,
  @JsonValue('unknown')
  Unknown,
}

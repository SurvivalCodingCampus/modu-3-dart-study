import 'package:json_annotation/json_annotation.dart';

enum PhotoEnum {
  @JsonValue('student')
  Article,
  @JsonValue('image')
  Image,
  @JsonValue('video')
  Video,
  @JsonValue('unknown')
  Unknown,
}

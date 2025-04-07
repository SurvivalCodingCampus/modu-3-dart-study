import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/photo_type_enum.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  @override
  final int id;
  @override
  final PhotoTypeEnum type;
  @override
  final String title;
  @override
  final String content;
  @override
  final String url;
  @override
  final DateTime createdAt;

  Photo({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.url,
    required this.createdAt,
  });
}

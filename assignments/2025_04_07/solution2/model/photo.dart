import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Photo with _$Photo {
  final String tags;
  final String imageUrl;

  Photo({required this.tags, required this.imageUrl});
}

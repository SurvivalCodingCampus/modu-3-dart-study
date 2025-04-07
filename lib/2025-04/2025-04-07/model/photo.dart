import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required List<String> tags,
    required String url,
  }) = _Photo;
}

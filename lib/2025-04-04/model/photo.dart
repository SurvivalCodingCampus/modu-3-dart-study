import 'enum/photo_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 코드 생성 파일 지정
part 'photo.freezed.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required String id,
    required PhotoType type,
    required String title,
    required String content,
    required String url,
    required String caption,
    required DateTime createdAt,
  }) = _Photo;
}

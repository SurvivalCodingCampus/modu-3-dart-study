import 'package:modu_3_dart_study/2025-04-04/exam1/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/exam1/model/photo.dart';

Type parseType(String? value) {
  switch (value?.toLowerCase()) {
    case 'article':
      return Type.Article;
    case 'image':
      return Type.Image;
    case 'video':
      return Type.Video;
    default:
      return Type.UnKnown;
  }
}

extension PhotoExtension on PhotoDto {
  Photo photo() {
    return Photo(
      id: id ?? -1,
      type: parseType(type),
      title: title ?? '제목 없음',
      url: url ?? 'url 없음',
      content: content ?? '콘텐츠 없음',
      caption: caption ?? '자막 없음',
      createdAt: createdAt ?? '생성날짜 없음',
    );
  }
}

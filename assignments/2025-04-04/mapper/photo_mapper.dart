import '../dto/photo_dto.dart';
import '../enum/photo_enum.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id?.toInt() ?? 0,
      type: type ?? PhotoEnum.Unknown,
      title: title ?? '제목 없음',
      content: content ?? '내용 없음',
      createdAt: DateTime.parse(created_at!) ?? DateTime.now(),
      url: url ?? 'url 없음',
      caption: caption ?? '캡션 없음',
    );
  }
}

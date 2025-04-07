import '../dto/photo_dto.dart';
import '../enum/photo_type_enum.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: idNum?.toInt() ?? int.parse(id ?? '-1'),
      type: eunmSwitch(type),
      title: title ?? '제목 없음',
      content: content ?? '내용 없음',
      url: url ?? '주소 없음',
      createdAt: DateTime.parse(createdAt ?? ''),
    );
  }
}

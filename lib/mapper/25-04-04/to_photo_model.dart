import '../../dto/25-04-04/photo_dto.dart';
import '../../model/25-04-04/photo.dart';
import '../../model/25-04-04/phototype.dart';

extension ToPhotoModel on PhotoDto {
  Photo toPhotoModel() {
    int parsedId = 0;
    if (id == null) {
      parsedId = 0;
    } else {
      if (id is int) {
        parsedId = id as int;
      } else if (id is String) {
        parsedId = int.parse(id as String);
      }
    }
    PhotoType typeChange = PhotoType.unknown;
    if (type != null) {
      try {
        typeChange = PhotoType.values.firstWhere((e) => e.name == type);
      } catch (e) {
        typeChange = PhotoType.unknown;
      }
    }

    return Photo(
      id: parsedId,
      title: title ?? '이름 없음',
      type: typeChange,
      content: content ?? '내용 없음',
      createdAt: DateTime.parse(createdAt ?? DateTime.now().toString()),
      url: url ?? '이미지 없음',
      caption: caption ?? '캡션 없음',
    );
  }
}

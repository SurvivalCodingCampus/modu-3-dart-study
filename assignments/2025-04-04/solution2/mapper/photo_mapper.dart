import '../dto/photo_dto.dart';
import '../model/content_type.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id?.toInt() ?? -1,
      type: contentTypeFromString(type),
      title: title ?? '',
      content: content ?? '',
      createdAt:
          createAt != null
              ? DateTime.parse(createAt.toString())
              : DateTime.now(),
    );
  }
}

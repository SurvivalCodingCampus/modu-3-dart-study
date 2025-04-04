import '../dto/photo_dto.dart';
import '../enum/media_type.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id.runtimeType == String ? int.parse(id) : id,
      type: MediaType.fromString(type),
      title: title,
      content: content,
      url: url,
      caption: caption,
      createdAt: DateTime.parse(createdAt ?? ''),
    );
  }
}

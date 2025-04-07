import '../dto/photo_dto.dart';
import '../enum/type_enum.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: int.tryParse(id?.toString() ?? '') ?? -1,
      type: mapType(type),
      title: title?.toString() ?? 'title',
      url: url?.toString() ?? 'url',
      content: content?.toString() ?? 'content',
      caption: caption?.toString() ?? 'caption',
      createdAt: DateTime.parse(createdAt ?? 'createAt'),
    );
  }

  PhotoType mapType(String? v) {
    return switch (v) {
      'article' => PhotoType.Article,
      'image' => PhotoType.Image,
      'video' => PhotoType.Video,
      _ => PhotoType.Unknown,
    };
  }
}

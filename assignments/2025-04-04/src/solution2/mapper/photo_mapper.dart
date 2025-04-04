import '../dto/photo_dto.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id != null ? int.tryParse(id.toString()) ?? 0 : 0,
      type: typeCheck(type),
      createdAt: DateTime.parse(createdAt ?? '1970-01-01'),
      title: title ?? '',
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
    );
  }
}

Type typeCheck(String? value) {
  Type returnType = Type.Unknown;
  if (value == 'article') {
    returnType = Type.Article;
  } else if (value == 'image') {
    returnType = Type.Image;
  } else if (value == 'video') {
    returnType = Type.Video;
  }
  return returnType;
}

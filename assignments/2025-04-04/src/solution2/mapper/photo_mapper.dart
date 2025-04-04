import 'package:modu_3_dart_study/2025-04-04/dto/photo_dto.dart';

import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id != null ? int.parse(id.toString()) : 0,
      type: typeCheck(type),
      createdAt: DateTime.parse(createdAt ?? '0'),
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

import 'package:modu_3_dart_study/assignments/2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/util/type_enum.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    PhotoType photoType = PhotoType.Unknown;
    if (type == 'article') {
      photoType = PhotoType.Article;
    } else if (type == 'image') {
      photoType = PhotoType.Image;
    } else if (type == 'video') {
      photoType = PhotoType.Video;
    }

    DateTime photoCreateAt =
        DateTime.tryParse(createdAt!) ?? DateTime(1999, 1, 1);

    return Photo(
      id: int.parse(id.toString()),
      type: photoType,
      title: title!,
      content: content!,
      url: url!,
      caption: caption!,
      createdAt: photoCreateAt,
    );
  }
}

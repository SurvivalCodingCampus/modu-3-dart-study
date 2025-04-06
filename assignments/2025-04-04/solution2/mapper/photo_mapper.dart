import 'package:modu_3_dart_study/2025-04-04/solution2/model/content_type.dart';
import 'package:modu_3_dart_study/2025-04-04/solution2/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-04/solution2/dto/photo_dto.dart';

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

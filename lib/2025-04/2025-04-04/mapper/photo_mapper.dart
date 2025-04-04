import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toModel() {
    return Photo(
      id: id!,
      type: type!,
      url: url!,
      content: content!,
      caption: caption!,
      createdAt: DateTime.parse(createdAt!),
    );
  }
}

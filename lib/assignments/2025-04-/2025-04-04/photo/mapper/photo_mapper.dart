import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/common/const/error_data.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/enum/photo_type.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto(){
    final stringNullData = ErrorData.stringNullData;
    return Photo(
      // int이면 반환,
      // String이면 Int parse
      // 그 외에는 예외처리
      id: (id is int) ? id : (id is String) ? int.parse(id) : Exception('올바르지 않은 id입니다.'),
      url: url ?? stringNullData,
      content: content ?? stringNullData,
      type: PhotoType.convertPhotoType(type),
      createdAt: (createdAt == null) ? DateTime.now() : DateTime.parse(createdAt!),
    );
  }
}
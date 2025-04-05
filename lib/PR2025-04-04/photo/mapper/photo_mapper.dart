import 'package:modu_3_dart_study/PR2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/enum/photo_enum.dart';

import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      //dto에 id가 num으로 선언되어있지만 나는 int형으로 받을 거기 때문에 toInt사용
      id: id?.toInt() ?? 0,
      type: type ?? PhotoEnum.Unknown,
      title: title ?? '제목 없음',
      content: content ?? '내용 없음',
      createdAt:
          created_at != null
              ? DateTime.tryParse(created_at!) ?? DateTime.now()
              : DateTime.now(),
      url: url ?? 'url 없음',
      caption: caption ?? '캡션 없음',
    );
  }
}

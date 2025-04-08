import 'package:modu_3_dart_study/2025-04-07/exam02/dto/pixabay_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/model/photo.dart';

extension PhotoMapper on Hits {
  Photo toPhoto() {
    return Photo(tags: tags ?? '', imageUrl: pageURL ?? '');
  }
}

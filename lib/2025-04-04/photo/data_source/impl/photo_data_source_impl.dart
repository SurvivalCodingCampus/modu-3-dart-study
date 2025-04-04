import 'package:modu_3_dart_study/2025-04-04/photo/data_source/photo_data_source.dart';

import '../../dto/photo_dto.dart';

class PhotoDataSourceImpl extends PhotoDataSource {
  static const String apiUrl = '';

  PhotoDataSourceImpl(PhotoDto dto, {super.client}) : super(apiUrl, dto);
}

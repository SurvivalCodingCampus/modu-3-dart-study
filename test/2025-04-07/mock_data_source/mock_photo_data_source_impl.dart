import 'package:modu_3_dart_study/2025-04-07/data_source/photo_data_source.dart';

import '../../../lib/2025-04-07/core/error.dart';
import '../../../lib/2025-04-07/dto/photo_dto.dart' show PhotoDto;

class MockPhotoDataSource implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    final mockPhotos = [
      PhotoDto(tags: '아이유', imageUrl: 'https://example.com/iu.jpg'),
      PhotoDto(tags: '아이돌', imageUrl: 'https://example.com/idol.jpg'),
    ];

    return mockPhotos.where((e) => e.tags == query).toList();
  }
}

class MockPhotoDataSourceWithError implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    throw ImageError.networkError;
  }
}

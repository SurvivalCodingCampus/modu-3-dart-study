import '../data_source/photo_data_source.dart';
import 'mock_photo.dart';

/// 파일 없이 메모리에서 목 데이터를 제공하는 DataSource
class MockPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchPhotos(int albumId) async {
    final allPhotos = getMockPhotos();
    return allPhotos.where((photo) => photo['albumId'] == albumId).toList();
  }
}
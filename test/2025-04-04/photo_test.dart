import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import 'package:modu_3_dart_study/assignments/2025-04-04/data_source/mock/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/model/photo_type.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/repository/photo_repository_imp.dart';

void main() {
  group('Photo', () {
    test('getPhotoList', () async {
      final httpClient = http.Client();
      final dataSource = MockPhotoDataSourceImpl(httpClient);
      final repository = PhotoRepositoryImp(dataSource);
      final photos = await repository.getPhotoList();

      expect(photos.length, 6);

      expect(photos[0].id, 1);
      expect(photos[1].type, PhotoType.image);
      expect(photos[2].url, 'https://example.com/video.mp4');
    });
  });
}

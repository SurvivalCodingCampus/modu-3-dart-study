import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('[ Photo Model Class ] - ', () {
    test('fromJson() 를 통해 photo 객체가 생성 되어야 한다.', () {
      final jsonData = {
        "albumId": 1,
        "id": 1,
        "title": "Test Title",
        "url": "https://via.placeholder.com/600/test",
        "thumbnailUrl": "https://via.placeholder.com/150/test"
      };
      final photo = Photo.fromJson(jsonData);

      expect(photo.albumId, 1);
      expect(photo.id, 1);
      expect(photo.title, "Test Title");
      expect(photo.url, "https://via.placeholder.com/600/test");
      expect(photo.thumbnailUrl, "https://via.placeholder.com/150/test");
    });

    test('toJson() 를 통해 JsonMap이 나와야 한다.', () {
      final photo = Photo(
        albumId: 1,
        id: 1,
        title: "Test Title",
        url: "https://via.placeholder.com/600/test",
        thumbnailUrl: "https://via.placeholder.com/150/test",
      );
      final jsonMap = photo.toJson();

      expect(jsonMap["albumId"], 1);
      expect(jsonMap["id"], 1);
      expect(jsonMap["title"], "Test Title");
      expect(jsonMap["url"], "https://via.placeholder.com/600/test");
      expect(jsonMap["thumbnailUrl"], "https://via.placeholder.com/150/test");
    });
  });

  group('[ PhotoRepository Class ] - ', () {
    MockPhotoDataSource mockDataSource = MockPhotoDataSource();
    PhotoRepository repository = PhotoRepositoryImpl(mockDataSource);

    test('getComments()는 albumId 해당 하는 Photo를 리턴 한다.', () async {
      final photos = await repository.getPhotos(1);

      expect(photos.length, 1);
      expect(photos.first.albumId, 1);
      expect(photos.first.title, "Test Title");
    });
  });
}

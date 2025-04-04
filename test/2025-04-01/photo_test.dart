import 'package:collection/collection.dart';
import 'package:test/test.dart';

import 'package:modu_3_dart_study/2025-04-01/model/photo.dart';

void main() {
  const List<Map<String, dynamic>> mockPhotos = [
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952",
    },
  ];

  group('Photos 테스트', () {
    test('직렬화, 역직렬화 테스트', () {
      final photos = mockPhotos.map((e) => Photo.fromJson(e)).toList();
      final jsonList = photos.map((e) => e.toJson()).toList();
      final deserializationPhotos =
          jsonList.map((e) => Photo.fromJson(e)).toList();

      expect(ListEquality().equals(photos, deserializationPhotos), isTrue);
      expect(
        photos[0].title.isNotEmpty,
        equals(deserializationPhotos[0].title.isNotEmpty),
      );
    });
  });
}

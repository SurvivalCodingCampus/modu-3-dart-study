import 'package:test/test.dart';

import '../../assignment/2025-04-01/model/album.dart';

void main() {
  const List<Map<String, dynamic>> mockAlbums = [
    {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
  ];

  group('Album 테스트', () {
    test('직렬화, 역직렬화 테스트', () {
      final albums = mockAlbums.map((e) => Album.fromJson(e)).toList();
      final jsonList = albums.map((e) => e.toJson()).toList();
      final deserializationAlbums =
          jsonList.map((e) => Album.fromJson(e)).toList();

      expect(albums, deserializationAlbums);
      expect(albums[0].title.isNotEmpty, deserializationAlbums[0].title.isNotEmpty);
    });
  });
}

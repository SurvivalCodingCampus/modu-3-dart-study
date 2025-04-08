import 'dart:io';
import 'package:collection/collection.dart';

import '../data_source/data_source.dart';
import '../data_source/mock/mock_album_data_source_impl.dart';
import '../model/album.dart';
import 'album_repository.dart';
import 'user_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final DataSource _albumDataSource;
  const AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    try {
      final filePath =
          '${Directory.current.path}/assignments/2025-04-01/albums.json';
      List<dynamic> jsonList = await _albumDataSource.getList(filePath);

      if (limit != null) {
        jsonList = jsonList.sublist(0, limit).toList();
      }

      return jsonList.map((json) => Album.fromJson(json)).toList();
    } catch (e) {
      print('예상치 못한 오류 발생: $e');
      return [];
    }
  }
}

void main() async {
  final mockAlbumDataSource = MockAlbumDataSourceImpl();
  final userRepository = AlbumRepositoryImpl(mockAlbumDataSource);

  List<Album> albums = await userRepository.getAlbums();

  print(albums[0]);
}

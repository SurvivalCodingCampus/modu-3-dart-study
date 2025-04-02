import 'package:modu_3_dart_study/2025-04-01/solution5/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution5/data_source/album_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution5/repository/album_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution5/repository/album_repository_impl.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

import '../mock/mock_album_data_source_impl.dart';

void main() {
  test('limit 을 지정하지 않으면 모든 데이터를 가져온다.', () {
    final AlbumRepository albumRepository = AlbumRepositoryImpl(AlbumDataSourceImpl());
    final albumList = albumRepository.getAlbums();
    expect(albumList.length, 100);
  });
  test('limit 을 지정하면 limit 갯수만큼 데이터를 가져온다.', () {
    final AlbumRepository albumRepository = AlbumRepositoryImpl(AlbumDataSourceImpl());
    final albumList = albumRepository.getAlbums(limit: 10);
    expect(albumList.length, 10);
  });
  test('Mock 데이터로 limit 을 지정하지 않으면 모든 데이터를 가져온다.', () {
    final AlbumRepository albumRepository = AlbumRepositoryImpl(MockAlbumDataSourceImpl());
    final albumList = albumRepository.getAlbums();
    expect(albumList.length, 3);
  });
  test('Mock 데이터로 limit 을 지정하면 limit 갯수만큼 데이터를 가져온다.', () {
    final AlbumRepository albumRepository = AlbumRepositoryImpl(MockAlbumDataSourceImpl());
    final albumList = albumRepository.getAlbums(limit: 1);
    expect(albumList.length, 1);
  });
}

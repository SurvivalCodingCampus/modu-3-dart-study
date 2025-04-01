import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/solution5/data_source/album_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution5/data_source/album_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution5/model/album.dart';
import 'package:test/test.dart';

void main() async {
  test('Album 가져 오기', () async {
    File file = File(
      'lib/2025-04-01/solution5/data_source/albums'
      '.json',
    );
    List fileDecode = jsonDecode(await file.readAsString());
    List<Map<String, dynamic>> dataSource = [];

    for (Map<String, dynamic> item in fileDecode) {
      dataSource.add(item);
    }

    AlbumRepository albumRepository = AlbumRepositoryImpl(
      dataSoure: dataSource,
    );

    List<Album> allAlbumList = await albumRepository.getAlbums();
    List<Album> AlbumTop10List = await albumRepository.getAlbums(limit: 10);

    expect(allAlbumList.length, equals(100));

    expect(AlbumTop10List.length, equals(10));
  });
}

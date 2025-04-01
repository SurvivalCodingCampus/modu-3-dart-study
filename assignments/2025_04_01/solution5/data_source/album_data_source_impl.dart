import 'dart:convert';
import 'dart:io';

import 'album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  final jsonFile = File(
    'C:\\Users\\Ujun\\modu-3-dart-study\\assignments\\2025_04_01\\solution5\\album.json',
  );

  @override
  Future<List<Map<String, dynamic>>> getAlbums() async {
    final jsonString = await jsonFile.readAsString();

    final List albums = jsonDecode(jsonString);

    return albums.map((e) => e as Map<String, dynamic>).toList();
  }
}

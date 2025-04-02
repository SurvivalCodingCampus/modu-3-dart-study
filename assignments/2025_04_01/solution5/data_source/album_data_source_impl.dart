import 'dart:convert';
import 'dart:io';

import 'album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  final jsonFile = File('assets/json/2025_04_01/album.json');

  @override
  Future<List<Map<String, dynamic>>> getAlbums() async {
    final jsonString = await jsonFile.readAsString();

    final List albums = jsonDecode(jsonString);

    return albums.map((e) => e as Map<String, dynamic>).toList();
  }
}

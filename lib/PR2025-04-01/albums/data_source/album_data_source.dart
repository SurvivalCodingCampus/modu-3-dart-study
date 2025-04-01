import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/PR2025-04-01/albums/model/album.dart';

class AlbumDataSource {
  final String path = 'lib/PR2025-04-01/albums/assets/albums.json';

  Future<List<Album>> getAlbums({int? limit}) async {
    final file = File(path);
    final fileContents = await file.readAsString();
    List<dynamic> listContents = jsonDecode(fileContents);
    List<Album> albumContents =
        listContents.map((e) => Album.fromJson(e)).toList();
    return albumContents;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/model/album.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final file = File('lib/2025-04-01/remote/album.json');
    final jsonString = await file.readAsString();

    final List<dynamic> jsonList = jsonDecode(jsonString);

    final albums =
        jsonList
            .map((json) => Album.fromJson(json as Map<String, dynamic>))
            .toList();

    return (limit != null && limit > 0) ? albums.take(limit).toList() : albums;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04/2025-04-01/model/album.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class AlbumDataSource implements DataSource<Album> {
  @override
  Future<List<Album>> load({
    String relativePath = '/lib/data/albums.json',
  }) async {
    File file = File(Directory.current.path + relativePath);
    List<dynamic> json = jsonDecode(await file.readAsString());

    return json
        .cast<Map<String, dynamic>>()
        .map((e) => Album.fromJson(e))
        .toList();
  }
}

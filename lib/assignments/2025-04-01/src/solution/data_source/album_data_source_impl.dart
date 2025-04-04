import 'dart:convert';
import 'dart:io';

import 'album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAlbums() async {
    final file =
        await File(
          'assignments/2025-04-01/src/solution/data_source/local/albums.json',
        ).readAsString();

    return (jsonDecode(file) as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();
  }
}

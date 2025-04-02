import 'dart:convert';
import 'dart:io';

import 'album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  final String path;

  AlbumDataSourceImpl({required this.path});

  @override
  Future<List<Map<String, dynamic>>> getAllAlbums() async {
    String jsonString = await File(path).readAsString();
    List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => e as Map<String, dynamic>).toList();

  }
}

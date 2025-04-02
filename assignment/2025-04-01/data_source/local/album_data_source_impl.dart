import 'dart:convert';
import 'dart:io';

import '../album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchAlbums(String path) async {
    final jsonString = await File(path).readAsString();
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}

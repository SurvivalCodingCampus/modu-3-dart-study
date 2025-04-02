import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/model/album.dart';
import 'album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  final String _filePath = "album_data.json";

  @override
  Future<List<Album>> getAlbums() async {
    final file = File(_filePath);
    final jsonString = await file.readAsString();
    final List<Map<String, dynamic>> jsonData = jsonDecode(jsonString);
    return jsonData.map((e) => Album.fromJson(e)).toList();
  }
}

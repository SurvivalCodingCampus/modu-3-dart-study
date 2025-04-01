import 'dart:convert';
import 'dart:io';
import '../album_datasource.dart';

class AlbumLocalDatasourceImpl implements AlbumDatasource {
  final String filePath;

  AlbumLocalDatasourceImpl({this.filePath = 'lib/2025-04-01/data/albums.json'});

  @override
  Future<List<Map<String, dynamic>>> fetchAlbums() async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final decoded = json.decode(jsonStr);

    return (decoded as List)
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }
}

import 'dart:convert';
import 'dart:io';
import '../album_datasource.dart';

class AlbumLocalDatasourceImpl implements AlbumDatasource {
  final String filePath;

  AlbumLocalDatasourceImpl({this.filePath = 'lib/data/albums.json'});

  @override
  Future<List<Map<String, dynamic>>> fetchAlbums() async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final List<dynamic> decoded = json.decode(jsonStr);
    return decoded.cast<Map<String, dynamic>>();
  }
}

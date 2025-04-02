import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/2025-04-01/data_source/album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  final String filePath;

  AlbumDataSourceImpl(this.filePath);

  @override
  Future<List<Map<String, dynamic>>> getAllAlbums() async {
    final file = File(filePath);
    final contents = await file.readAsString();
    final List<dynamic> jsonData = json.decode(contents);
    return jsonData.cast<Map<String, dynamic>>();
  }
}
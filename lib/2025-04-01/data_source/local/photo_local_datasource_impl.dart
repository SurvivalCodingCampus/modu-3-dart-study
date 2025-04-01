import 'dart:convert';
import 'dart:io';
import '../photo_datasource.dart';

class PhotoLocalDatasourceImpl implements PhotoDatasource {
  final String filePath;

  PhotoLocalDatasourceImpl({this.filePath = 'lib/2025-04-01/data/photos.json'});

  @override
  Future<List<Map<String, dynamic>>> fetchPhotos() async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final decoded = json.decode(jsonStr);

    return (decoded as List)
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }
}

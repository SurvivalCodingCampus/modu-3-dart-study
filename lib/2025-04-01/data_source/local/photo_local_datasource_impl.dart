import 'dart:convert';
import 'dart:io';
import '../photo_datasource.dart';

class PhotoLocalDatasourceImpl implements PhotoDatasource {
  final String filePath;

  PhotoLocalDatasourceImpl({this.filePath = 'lib/data/photos.json'});

  @override
  Future<List<Map<String, dynamic>>> fetchPhotos() async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final List<dynamic> decoded = json.decode(jsonStr);
    return decoded.cast<Map<String, dynamic>>();
  }
}

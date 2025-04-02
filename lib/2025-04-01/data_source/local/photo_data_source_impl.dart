import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/2025-04-01/data_source/photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String filePath;

  PhotoDataSourceImpl(this.filePath);

  @override
  Future<List<Map<String, dynamic>>> getAllPhotos() async {
    final File file = File(filePath);
    final String jsonString = await file.readAsString();
    final List<dynamic> data = json.decode(jsonString);
    return List<Map<String, dynamic>>.from(data);
  }
}
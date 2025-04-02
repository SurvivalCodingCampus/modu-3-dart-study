import 'dart:convert';
import 'dart:io';

import 'photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  String path;
  PhotoDataSourceImpl({required this.path});
  @override
  Future<List<Map<String, dynamic>>> getAllPhotos() async {
    String jsonString = await File(path).readAsString();
    List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => e as Map<String, dynamic>).toList();
  }
}

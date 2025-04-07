import 'dart:convert';
import 'dart:io';

import 'photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  String path;

  @override
  Future<List<Map<String, dynamic>>> fetchPhotos() async {
    File file = File(path);
    String fileString = await file.readAsString();
    List fileList = jsonDecode(fileString);
    List<Map<String, dynamic>> mappingList = [];

    for (Map<String, dynamic> items in fileList) {
      mappingList.add(items);
    }

    return mappingList;
  }

  PhotoDataSourceImpl({required this.path});
}

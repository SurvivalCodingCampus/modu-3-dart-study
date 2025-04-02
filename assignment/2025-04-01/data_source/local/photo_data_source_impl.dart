import 'dart:convert';
import 'dart:io';

import '../photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchPhotos(String path) async {
    final jsonString = await File(path).readAsString();
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}

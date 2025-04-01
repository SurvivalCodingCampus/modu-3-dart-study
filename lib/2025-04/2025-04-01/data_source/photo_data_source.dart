import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04/2025-04-01/model/photo.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class PhotoDataSource implements DataSource<Photo> {
  @override
  Future<List<Photo>> load({
    String relativePath = '/lib/data/photos.json',
  }) async {
    File file = File(Directory.current.path + relativePath);
    List<Map<String, dynamic>> json = jsonDecode(await file.readAsString());

    return json.map((e) => Photo.fromJson(e)).toList();
  }
}

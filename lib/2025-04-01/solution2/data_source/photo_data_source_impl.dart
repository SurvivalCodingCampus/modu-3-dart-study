import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final File file = File('lib/2025-04-01/solution2/photos.json');

  @override
  Future<List<Map<String, dynamic>>> getPhotos() async {
    final List<dynamic> jsonList = jsonDecode(await file.readAsString());
    return jsonList
        .map((e) => e as Map<String, dynamic>) // 굳이 명시함
        .toList();
  }
}
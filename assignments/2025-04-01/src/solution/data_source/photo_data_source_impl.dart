import 'dart:convert';
import 'dart:io';

import 'photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getPhotos() async {
    final file =
        await File(
          'assignments/2025-04-01/src/solution/data_source/local/photos.json',
        ).readAsString();

    final List photosList = jsonDecode(file);
    return photosList.map((e) => e as Map<String, dynamic>).toList();
  }
}

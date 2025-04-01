import 'dart:convert';
import 'dart:io';

import 'photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final jsonFile = File(
    'C:\\Users\\Ujun\\modu-3-dart-study\\assignments\\2025_04_01\\solution2\\photo.json',
  );
  @override
  Future<List<Map<String, dynamic>>> getPhotos() async {
    final jsonString = await jsonFile.readAsString();

    final List photos = jsonDecode(jsonString);

    return photos.map((e) => e as Map<String, dynamic>).toList();
  }
}

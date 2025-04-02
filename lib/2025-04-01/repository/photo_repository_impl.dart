import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/repository/photo_repository.dart';
import '../model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      final file = File('lib/2025-04-01/remote/photo.json');
      final jsonString = await file.readAsString();

      final List<dynamic> jsonList = jsonDecode(jsonString);
      final photos =
          jsonList
              .map((json) => Photo.fromJson(json as Map<String, dynamic>))
              .where((photo) => photo.albumId == albumId)
              .toList();

      return photos;
    } catch (e) {
      print('Error fetching photos: $e');
      return [];
    }
  }
}

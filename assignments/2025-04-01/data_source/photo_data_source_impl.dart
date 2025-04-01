import 'dart:io';
import 'dart:convert';
import 'photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String filePath;

  PhotoDataSourceImpl({required this.filePath});

  @override
  Future<List<Map<String, dynamic>>> fetchPhotos(int albumId) async {
    try {
      final file = File(filePath);

      if (!await file.exists()) {
        throw Exception('File not found: $filePath');
      }

      final String jsonString = await file.readAsString();
      final List<dynamic> decoded = jsonDecode(jsonString);

      final List<Map<String, dynamic>> photos =
          decoded.map((e) => Map<String, dynamic>.from(e)).toList();

      // albumId에 해당하는 댓글만 필터링
      return photos.where((photo) => photo['albumId'] == albumId).toList();
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }
}
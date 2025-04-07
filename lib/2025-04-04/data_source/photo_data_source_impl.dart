import 'dart:convert';
import 'dart:io';
import '../dto/photo_dto.dart';
import 'photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String jsonPath;

  PhotoDataSourceImpl({required this.jsonPath});

  @override
  Future<List<PhotoDto>> fetchPhotos() async {
    try {
      final file = File(jsonPath);
      final jsonString = await file.readAsString();
      final jsonList = jsonDecode(jsonString);

      if (jsonList is! List) return [];

      return jsonList
          .whereType<Map<String, dynamic>>()
          .map(PhotoDto.fromJson)
          .toList();
    } catch (e) {
      print('Error reading photo data: $e');
      return [];
    }
  }
}
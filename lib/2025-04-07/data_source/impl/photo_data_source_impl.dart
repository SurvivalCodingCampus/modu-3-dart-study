import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-07/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/photo_dto.dart';
import 'package:modu_3_dart_study/enums/photo_error.dart';

class PhotoDataSourceImpl extends PhotoDataSource {
  static const String apiUrl =
      'https://pixabay.com/api/?key=49670360-5e3dfeb8b9e3477ca36d36171';

  PhotoDataSourceImpl(PhotoDto dto, {super.client, String? httpUrl})
    : super(httpUrl ?? apiUrl, dto);

  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    final httpData = await client.get(
      Uri.parse('$httpUrl$query'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );
    if (httpData.statusCode == 200) {
      final httpBody = httpData.body;
      final Map<String, dynamic> httpJson = jsonDecode(httpBody);
      final List<dynamic> photoList = httpJson['hits'];

      return photoList
          .map((e) => dto.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw PhotoError.networkError;
    }
  }
}

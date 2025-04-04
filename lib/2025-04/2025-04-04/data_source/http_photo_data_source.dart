import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/photo_dto.dart';

class HttpPhotoDataSource implements PhotoDataSource {
  final http.Client _client;

  const HttpPhotoDataSource(this._client);

  @override
  Future<List<PhotoDto>> fetch() async {
    const String url = 'http://example.com';
    Uri uri = Uri.parse(url);

    final http.Response data = await _client.get(uri);
    List json = jsonDecode(data.body);

    return json
        .cast<Map<String, dynamic>>()
        .map((e) => PhotoDto.fromJson(e))
        .toList();
  }
}

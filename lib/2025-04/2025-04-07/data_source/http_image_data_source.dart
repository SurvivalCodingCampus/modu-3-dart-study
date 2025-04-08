import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/common/data_source.dart';

class HttpImageDataSource implements DataSource<Map<String, dynamic>> {
  final http.Client _client;

  const HttpImageDataSource(this._client);

  @override
  Future<List<Map<String, dynamic>>> fetch(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      final http.Response response = await _client.get(uri);

      if (response.statusCode != 200) {
        throw Exception('Network Error');
      }

      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> images = json['hits'];

      return List.from(images.map((e) => e as Map<String, dynamic>));
    } catch (e) {
      throw Exception('Network Error');
    }
  }
}

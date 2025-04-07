import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/dto_utils/json_convert.dart';

abstract class DtoDataSource<T extends JsonConvert<T, E>, E> {
  final http.Client client;
  final String httpUrl;
  final T dto;

  DtoDataSource(this.httpUrl, this.dto, {http.Client? client})
    : client = client ?? http.Client();

  Future<T> getItem(int id) async {
    final httpData = await client.get(Uri.parse('$httpUrl/$id'));
    if (httpData.statusCode == 200) {
      final Uint8List httpBody = httpData.bodyBytes;
      final Map<String, dynamic> httpJson = jsonDecode(utf8.decode(httpBody));

      return dto.fromJson(httpJson);
    }
    return dto;
  }

  Future<List<T>> getItems() async {
    final httpData = await client.get(Uri.parse(httpUrl));
    if (httpData.statusCode == 200) {
      final Uint8List httpBody = httpData.bodyBytes;
      final Map<String, dynamic> httpJson = jsonDecode(utf8.decode(httpBody));
      final List<dynamic> result = httpJson['results'];

      return result
          .map((e) => dto.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

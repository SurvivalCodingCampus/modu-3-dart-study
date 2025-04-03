import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04/2025-04-03/http/http_client.dart';

class HttpClientImpl implements HttpClient {
  @override
  Future get(Uri url) async {
    final http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    Map<String, dynamic> body = jsonDecode(response.body);

    return body;
  }
}

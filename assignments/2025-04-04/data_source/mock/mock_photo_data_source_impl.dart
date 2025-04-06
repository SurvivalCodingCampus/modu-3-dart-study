import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../../dto/photo_dto.dart';
import '../photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  final http.Client _client;

  MockPhotoDataSourceImpl(this._client);

  final String _url = 'https://photos.com';

  @override
  Future<List<PhotoDto>> getPhotoList() async {
    final client = MockClient((request) async {
      if (request.url.toString() == _url) {
        return http.Response(
          jsonEncode([
            {
              "id": 1,
              "type": "article",
              "title": "This is an article",
              "content": "This is the content of the article.",
              "created_at": "2020-01-01",
            },
            {
              "id": 2,
              "type": "image",
              "url": "https://example.com/image.jpg",
              "caption": "This is an image.",
              "created_at": "2020-02-02",
            },
            {
              "id": 3,
              "type": "video",
              "url": "https://example.com/video.mp4",
              "caption": "This is a video.",
              "created_at": "2020-03-03",
            },
            {
              "id": "1",
              "type": "article",
              "title": "This is an article",
              "content": "This is the content of the article.",
              "created_at": "2020-01-01",
            },
            {
              "id": 2,
              "type": null,
              "url": "https://example.com/image.jpg",
              "caption": "This is an image.",
              "created_at": "2020-02-02",
            },
            {
              "id": 3,

              "url": "https://example.com/video.mp4",
              "caption": "This is a video.",
              "created_at": "2020-03-03",
            },
          ]),
          200,
          headers: {"content-type": "application/json; charset=utf-8"},
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(Uri.parse(_url));

    switch (response.statusCode) {
      case 200:
        final List<Map<String, dynamic>> jsonList =
            jsonDecode(response.body).cast<Map<String, dynamic>>();
        return jsonList.map((e) => PhotoDto.fromJson(e)).toList();
      case 404:
        final message = jsonDecode(response.body)['message'];
        throw HttpException('404 Not Found: $message');
      case 500:
        throw HttpException('500 Internal Server Error');
      default:
        throw HttpException('Unexpected error: ${response.statusCode}');
    }
  }
}

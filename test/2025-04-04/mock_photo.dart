import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-04/exam1/data_source/photo_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  test('fetch photo', () async {
    final mockClient = MockClient((request) async {
      if (request.url.toString() == 'https://test.api/photos') {
        return http.Response(
          json.encode([
            {
              "id": 1,
              "type": "article",
              "title": "This is an article",
              "content": "This is the content of the article",
              "caption": "",
              "url": "",
              "created_at": "2020-01-01",
            },
            {
              "id": 2,
              "type": "image",
              "url": "https://example.com/image.jpg",
              "caption": "Test image",
              "title": "",
              "content": "",
              "created_at": "2020-02-02",
            },
          ]),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });

    final dataSource = PhotoDataSourceImpl();
    final photoDtos = await dataSource.fetchPhoto();

    expect(photoDtos.length, 2);

    final photos = photoDtos.map((e) => e.toModel()).toList();
    expect(photos[0].type.name, 'article');
    expect(photos[1].type.name, 'image');
    expect(photos[0].id, 1);
    expect(dataSource.client, mockClient);
  });
}

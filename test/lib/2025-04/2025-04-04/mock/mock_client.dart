import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

final http.Client storeMockClient = MockClient((request) async {
  final String json = jsonEncode({
    "stores": [
      {
        "addr": "서울특별시 강북구 솔매로 38 (미아동)",
        "code": "11817488",
        "created_at": "2020/07/03 11:00:00",
        "lat": 37.6254369,
        "lng": 127.0164096,
        "name": "승약국",
        "remain_stat": "plenty",
        "stock_at": "2020/07/02 18:05:00",
        "type": "01",
      },
      {
        "addr": "서울특별시 강북구 삼양로 247 3층 (미아동)",
        "code": "12856941",
        "created_at": "2020/07/03 11:00:00",
        "lat": 37.6255182,
        "lng": 127.017747,
        "name": "대지약국",
        "remain_stat": "plenty",
        "stock_at": "2020/07/03 10:45:00",
        "type": "01",
      },
    ],
  });

  return http.Response(
    json,
    200,
    headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
  );
});

final http.Client photoMock = MockClient((request) async {
  final String json = jsonEncode([
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
  ]);

  return http.Response(
    json,
    200,
    headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
  );
});

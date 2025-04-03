import 'package:modu_3_dart_study/2025-04/2025-04-03/http/http_client.dart';

class MockHttpClient implements HttpClient {
  @override
  Future get(Uri uri) async {
    return {
      'results': [
        {
          "id": 939243,
          "title": "수퍼 소닉 3",
          "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
          "release_date": "2024-12-19",
        },
        {
          "id": 939244,
          "title": "수퍼 소닉 4",
          "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
          "release_date": "2024-12-20",
        },
      ],
      'page': 1,
      'total_pages': 1,
    };
  }
}

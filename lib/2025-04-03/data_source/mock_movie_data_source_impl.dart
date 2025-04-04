import 'dart:convert';

import 'movie_data_source.dart';

class MockMovieDataSourceImpl implements MovieDataSource {
  @override
  Future<Map<String, dynamic>> getUpcomingMovies() async {
    final fullJson = jsonDecode('''
  {
    "results": [
      {
        "id": 1,
        "title": "냉장고를 부탁해: 좀비 에디션",
        "overview": "요리 좀비들과 펼치는 음식 서바이벌",
        "release_date": "2025-02-23"
      },
      {
        "id": 2,
        "title": "USB의 역습",
        "overview": "아무도 몰랐던 USB의 진실이 밝혀진다",
        "release_date": "2025-07-01"
      },
      {
        "id": 3,
        "title": "치킨이 날아다닌다",
        "overview": "양념 반 후라이드 반, 그리고 날개",
        "release_date": "2024-11-30"
      },
      {
        "id": 4,
        "title": "기억을 잃은 고양이",
        "overview": "지난 여름, 길 잃은 고양이와의 이야기",
        "release_date": "2025-08-11"
      }
    ]
  }
  ''');

    return fullJson;
  }
}

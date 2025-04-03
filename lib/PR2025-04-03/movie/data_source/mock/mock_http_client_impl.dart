import 'package:modu_3_dart_study/PR2025-04-03/movie/data_source/movie_data_source.dart';

class MockHttpClientImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    return [
      {
        "id": 939243,
        "title": "수퍼 소닉 3",
        "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
        "release_date": "2024-12-19",
      },
    ];
  }
}

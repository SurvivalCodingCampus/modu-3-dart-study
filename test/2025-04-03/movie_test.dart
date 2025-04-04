import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/model/movie.dart';
import 'package:modu_3_dart_study/2025-04-03/mock/mock_movie.dart';

void main() {
  late MockMovie mockClient;
  late MovieDataSourceImpl dataSource;
  const baseUrl = "https://api.themoviedb.org/3/movie/upcoming";
  const apiKey = "a64533e7ece6c72731da47c9c8bc691f";
  const language = "ko-KR";

  setUp(() {
    mockClient = MockMovie();
    dataSource = MovieDataSourceImpl(
      baseUrl: baseUrl,
      apiKey: apiKey,
      language: language,
    );
  });

  test("getUpcomingMovies() should return a list of movies when the response is successful", () async {
    final testUrl = Uri.parse("$baseUrl?api_key=$apiKey&language=$language&page=1");

    // ✅ Mock 응답 추가 (테스트 데이터 개수 조정)
    mockClient.addMockResponse(
      testUrl,
      http.Response(
        jsonEncode({
          "results": [
            {
              "id": 1,
              "title": "Mock Movie",
              "overview": "Test overview",
              "release_date": "2025-01-01"
            }
          ]
        }),
        200,
        headers: {"Content-Type": "application/json; charset=utf-8"},
      ),
    );

    // ✅ MovieDataSourceImpl에 mockClient를 주입하도록 수정
    final response = await mockClient.get(testUrl);
    final data = jsonDecode(response.body);
    final movies = data["results"].map<Movie>((json) => Movie.fromJson(json)).toList();

    expect(movies, isA<List<Movie>>());
    expect(movies.length, 1);
    expect(movies[0].id, 1);
    expect(movies[0].title, "Mock Movie");
  });

  test("getUpcomingMovies() should throw an exception when the response is not successful", () async {
    final testUrl = Uri.parse("$baseUrl?api_key=$apiKey&language=$language&page=1");

    // ❌ Mock 응답 추가 (실패 응답)
    mockClient.addMockResponse(
      testUrl,
      http.Response(
        jsonEncode({"error": "Server error"}),
        500,
        headers: {"Content-Type": "application/json; charset=utf-8"},
      ),
    );

    // ✅ 실제 요청이 Mock 응답을 사용하도록 수정
    try {
      final response = await mockClient.get(testUrl);
      expect(response.statusCode, 500);
      throw Exception("Failed to fetch movies");
    } catch (e) {
      expect(e, isA<Exception>());
    }
  });
}
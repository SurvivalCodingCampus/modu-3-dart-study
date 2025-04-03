import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/data_source/movie_data_source_impl.dart';
import 'package:test/test.dart';

void main() async {
  final mockJson = {
    'id': 939243,
    'title': '수퍼 소닉 3',
    'overview': '너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...',
    'release_date': '2024-12-19',
  };

  test("1. MockClient를 이용한 api test", () async {
    final client = MockClient((request) async {
      return http.Response.bytes(
        utf8.encode(jsonEncode(mockJson)),
        200,
        headers: {'Content-Type': 'application/json'},
      );
    });

    final MovieDataSource dataSource = MovieDataSourceImpl();

    final Map<String, dynamic> data = await dataSource.mockGetUpcomingMovies(
      mockClient: client,
    );

    expect(data, mockJson);
  });
}

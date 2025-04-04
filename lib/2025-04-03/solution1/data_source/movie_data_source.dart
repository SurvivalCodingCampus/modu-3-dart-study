import 'package:http/testing.dart';

abstract interface class MovieDataSource {
  Future<List<Map<String, dynamic>>> getUpcomingMovies();

  Future<Map<String, dynamic>> mockGetUpcomingMovies({
    required MockClient mockClient,
  });
}


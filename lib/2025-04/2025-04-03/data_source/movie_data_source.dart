abstract interface class MovieDataSource {
  Future<List<Map<String, dynamic>>> getUpcomingMovies(Uri url);
}

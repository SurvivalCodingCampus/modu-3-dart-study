abstract interface class MovieDataSource {
  Future<Map<String, dynamic>> getUpcomingMovies();
}

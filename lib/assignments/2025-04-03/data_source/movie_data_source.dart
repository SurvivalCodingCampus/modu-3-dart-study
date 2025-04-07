import 'package:http/http.dart' as http;

abstract interface class MovieDataSource {
  Future<List<Map<String, dynamic>>> getMovies();
}

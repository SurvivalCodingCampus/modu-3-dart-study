import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/http/http_client.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final HttpClient _httpClient;

  MovieDataSourceImpl(this._httpClient);

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies(Uri url) async {
    Map<String, dynamic> body = await _httpClient.get(url);

    return body['results'].cast<Map<String, dynamic>>();
  }
}

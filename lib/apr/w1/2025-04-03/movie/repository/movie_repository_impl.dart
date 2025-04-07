import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/apr/w1/2025-04-03/movie/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/movie/data_source/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/movie/movie.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/movie/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final jsonList = await _movieDataSource.getUpcomingMovies();

    final movieList = jsonList.map((e) => Movie.fromJson(e)).toList();

    return movieList;
  }
}

void main() async {
  final client = http.Client();
  final ds = MovieDataSourceImpl(client);
  final data = MovieRepositoryImpl(ds);

  final movies = await data.getMovieInfoList();

  for (final movie in movies) {
    print(movie);
  }
  client.close();
}

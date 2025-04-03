import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/model/movie.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  const MovieRepositoryImpl({required MovieDataSource movieDataSource})
    : _movieDataSource = movieDataSource;

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final upcomingMoviesList = await _movieDataSource.getUpcomingMovies();
    List<Movie> movies =
        upcomingMoviesList.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }
}

// void main() async {
//   final MovieRepository movieRepository = MovieRepositoryImpl(
//     movieDataSource: MovieDataSourceImpl(
//       uri:
//           'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
//     ),
//   );
//
//   print(await movieRepository.getMovieInfoList());
// }

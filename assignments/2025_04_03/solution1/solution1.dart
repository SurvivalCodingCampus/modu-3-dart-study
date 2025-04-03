import 'data_source/movie_data_source_impl.dart';
import 'repository/movie_repository_impl.dart';

void main() async {
  final movieDataSourceImpl = MovieDataSourceImpl();
  final movieRepositoryImpl = MovieRepositoryImpl(movieDataSourceImpl);

  // print(await movieDataSourceImpl.getUpcomingMovies());
  print(await movieRepositoryImpl.getMovieInfoList());
}

import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/repository/movie_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/repository/movie_repository_impl.dart';

import 'data_source/http_movie_data_source_impl.dart';

void main() async {
  final MovieRepository movieRepository = MovieRepositoryImpl(
    movieDataSource: HttpMovieDataSourceImpl(),
  );

  final result = await movieRepository.getMovieInfoList();
  print(result);
}
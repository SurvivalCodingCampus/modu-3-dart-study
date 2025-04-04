import 'package:modu_3_dart_study/2025-04-03/movie/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/utils/json_repository.dart';

import '../model/movie.dart';

abstract class MovieRespository
    extends JsonRepository<Movie, int, MovieDataSource> {
  MovieRespository(super.dataSource, super.entity);
}

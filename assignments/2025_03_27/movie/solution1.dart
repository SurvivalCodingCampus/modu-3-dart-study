import 'movie.dart';

void main() {
  Movie movie = Movie();
  print('movie 생성 완료');

  final movieData = movie.getMovieInfo();
  movieData.then((value) => print(value.director));
}

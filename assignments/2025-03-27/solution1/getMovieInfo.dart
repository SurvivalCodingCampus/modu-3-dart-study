import 'Movie.dart';

Future<Movie> getMoiveInfo({required Map<String, dynamic> movieData}) async {
  await Future.delayed(Duration(seconds: 2));

  return Movie.fromJson(movieData);
}

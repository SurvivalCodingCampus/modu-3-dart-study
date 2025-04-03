
import 'package:modu_3_dart_study/2025-03-27/solution1/Movie.dart';

Future<Movie> getMoiveInfo({required Map<String, dynamic> movieData}) async {
  await Future.delayed(Duration(seconds: 2));

  return Movie.fromJson(movieData);
}

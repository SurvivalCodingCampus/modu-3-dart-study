import 'dart:convert';
import 'dart:io';

void main() async {
  Movie movie = await getMovieInfo();
  print(movie.director);
}

Future<Movie> getMovieInfo() async {
  try {
    print('영화정보를 가져옵니다....');
    await Future.delayed(Duration(seconds: 2));

    final String filePath =
        Directory.current.path + '/assignments/2025-03-27/movie.json';
    // 1. 파일 열기
    final File jsonFile = File(filePath);
    String jsonFromFile = await jsonFile.readAsString();
    // 2. JSON 문자열 -> Map 변환
    Map<String, dynamic> jsonMap = jsonDecode(jsonFromFile);
    // 3. Map -> User 객체 생성
    Movie deserializedMovie = Movie.fromJson(jsonMap);
    print('영화정보: $deserializedMovie');
    return deserializedMovie;
  } on FormatException {
    throw FormatException('JSON 파싱 중 오류가 발생했습니다');
  } catch (e) {
    throw Exception('예상치 못한 오류가가 발생했습니다.: $e');
  }
}

class Movie {
  String title;
  String director;
  int year;

  Movie({required this.title, required this.director, required this.year});

  // 역직렬화
  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      year = json['year'];

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'year': year};
  }

  @override
  String toString() => 'Movie(title: $title, director: $director, year: $year)';
}

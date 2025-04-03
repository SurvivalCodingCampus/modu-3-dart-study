import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  static const url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(url));
    if ((response.statusCode == 200)) {
      //api에서 받아온 json 파일을 Map<String, dynamic> 디코딩해주기
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      // 원본이 results라는 리스트 안에 존재하기 때문에 jsonData['results'] 형태로 처리해야한다
      final List<dynamic> results = jsonData['results'];
      //List<dynamic>으로 변환한 데이터는 함수에서 ist<Map<String, dynamic>> 이 타입으로 받으니 from 을 사용해 형변환해서 출력
      return List<Map<String, dynamic>>.from(results);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
}

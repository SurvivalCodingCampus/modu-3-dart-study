import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/common/const/api_url.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/common/model/api_response.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/data_source/movie_data_source.dart';
import 'package:http/http.dart' as http;

class MovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    try {
    final path = ApiUrl.movieBaseUrl;
    final resp = await http.get(Uri.parse(path));
    if(resp.statusCode != 200){
      throw Exception('요청 실패 - statusCode: ${resp.statusCode}');
    }
    final apiResp = ApiResponse.fromJson(jsonDecode(resp.body));
    return apiResp.results;
    } catch (e){
      throw Exception('알 수 없는 에러: $e');
    }
  }
}

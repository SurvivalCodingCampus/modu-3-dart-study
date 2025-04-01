import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/PR2025-04-01/comments/model/comment.dart';

class CommentDataSource {
  //데이터소스 = 다트에서 사용하기 좋은 map , list형태 생성자로받음
  final String path = 'lib/PR2025-04-01/comments/assets/comments.json';

  Future<List<Comment>> getComments() async {
    final file = File(path);
    final String contents = file.readAsStringSync();

    // json형태의 파일인 contents를 List<Map<String,dynamic>>으로 역직렬화
    final List<dynamic> jsonList = jsonDecode(contents);
    // List<dynamic>을 List<Comment>로 변환시켜줌
    return jsonList.map((e) => Comment.fromJson(e)).toList();
  }
}

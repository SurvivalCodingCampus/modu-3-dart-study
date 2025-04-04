import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  getComments(1);
  postComments();
  patchComments(1);
  deleteComment(1);
}

// api에서 내용 받아오기, 내부에 인자 있으면 해당 id만 추출하고 없다면 전체적으로 출력
Future<void> getComments(int id) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/comments/$id'),
  );
  if ((response.statusCode == 200)) {
    print(json.decode(response.body));
  }
}

//새로운 comment 추가하는 코드
Future<void> postComments() async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': 'rlagustn070@naver.com',
      'name': '내가 새로만든 name',
      'body': '내가 새러만든 body',
    }),
  );
  //201 = 요청 성공적처리, 새 리소스 생성
  if ((response.statusCode == 201)) {
    print(json.decode(response.body));
  }
}

//전부변경
Future<void> putComments(int id) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/comments/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': '내가 바꾼 name',
      'body': '내가 바꾼 body',
    }),
  );
  if ((response.statusCode == 200)) {
    print(json.decode(response.body));
  }
}

//일부변경
Future<void> patchComments(int id) async {
  final response = await http.patch(
    Uri.parse('https://jsonplaceholder.typicode.com/comments/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'name': '내가 바꾼 name'}),
  );
  if ((response.statusCode == 200)) {
    print(json.decode(response.body));
  }
}

Future<void> deleteComment(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/comments/$id'),
  );
  if (response.statusCode == 200) {
    print('success');
  }
}

# HTTP

- URL 을 던짐
- GET 요청으로 서버의 문서를 읽어옴
- 웹에서 보는 이미지, 영상, 파일 가튼 데이터는 Base64 인코딩하여 사용

## get =데이터 받아옴

```dart
Future<void> getComments(int id) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/comments/$id'),
  );
  if ((response.statusCode == 200)) {
    print(json.decode(response.body));
  }
}

```

## post = 로그인, 주문요청할때 사용

```dart
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
```

## delete = 삭제

```dart
Future<void> deleteComment(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/comments/$id'),
  );
  if (response.statusCode == 200) {
    print('success');
  }
}
```

## put = 전체업데이트

```dart
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

```

## patch = 일부 업데이트

```dart
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

```

### 상태 코드

- 200 : OK
- 400 : Bad Request
- 404 : Not Found
- 500 : Internal Server Error
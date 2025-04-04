# 연습문제 1 - 영화 정보 불러오기

```dart
// 1. 모델 클래스
class Movie {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
}

// 2. DataSource 인터페이스
abstract class MovieDataSource {
  Future<List<Map<String, dynamic>>> getUpcomingMovies();
}

// 3. Repository 인터페이스
abstract class MovieRepository {
  Future<List<Movie>> getMovieInfoList();
}
```

## 📌 요구사항

1. 실제 TMDB API를 호출하는 `MovieDataSourceImpl` 구현
2. 테스트 시 `MockHttpClient` 활용 (실제 API 호출 없이 테스트)
3. `MovieRepositoryImpl` 구현

## 🧪 테스트 데이터

```json
{
  "id": 939243,
  "title": "수퍼 소닉 3",
  "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
  "release_date": "2024-12-19"
}
```

> API 엔드포인트  
> `https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1`

---

# 연습문제 2 - 사진 다운로드 기능

## 📦 DataSource 인터페이스

```dart
abstract class ImageDataSource {
  Future<Uint8List> fetchImage(String url);
  Future<void> saveImage(Uint8List bytes, String path);
}
```

## 📦 Repository 인터페이스

```dart
abstract class ImageRepository {
  // URL에서 이미지를 다운로드하여 지정된 경로에 저장
  Future<void> saveImage(String url, String path);

  // 여러 URL의 이미지를 지정된 디렉토리에 저장
  Future<void> saveImages(List<String> urls, String directory);

  // (제외) 이미지가 존재하지 않는 경우에만 URL에서 다운로드하여 저장
  // Future<bool> saveImageIfNotExists(String url, String path);
}
```

---

# 연습문제 3 - HttpClient Mocking

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

// Todo 데이터를 위한 데이터 모델 클래스
class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

// Todo 데이터를 가져오는 인터페이스 정의
abstract class TodoDataSource {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodo(int id);
}

// TodoDataSource 구현체
class TodoDataSourceImpl implements TodoDataSource {
  final http.Client client;

  TodoDataSourceImpl(this.client);

  @override
  Future<List<Todo>> getTodos() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Todo.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<Todo> getTodo(int id) async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));

    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todo');
    }
  }
}
```

## ✅ 구현 요약

- `TodoDataSource` 인터페이스 정의
- `TodoDataSourceImpl` 구현
- `MockHttpClient`를 활용한 테스트 환경 구성
- `TodoRepository` 작성 및 테스트 진행

## 🧪 참고 예시

```dart
final client = MockClient((request) async {
  if (request.url.toString() == 'https://jsonplaceholder.typicode.com/todos') {
    return http.Response(
      json.encode([
        {'id': 1, 'title': 'Test Todo 1', 'completed': false},
        {'id': 2, 'title': 'Test Todo 2', 'completed': true},
      ]),
      200,
    );
  } else if (request.url.toString() == 'https://jsonplaceholder.typicode.com/todos/1') {
    return http.Response(
      json.encode({'id': 1, 'title': 'Test Todo 1', 'completed': false}),
      200,
    );
  }
  return http.Response('Not Found', 404);
});

final dataSource = TodoDataSourceImpl(client);
```

## 🧾 테스트용 가짜 데이터

```json
// todos
[
  {"id": 1, "title": "Todo 1", "completed": false},
  {"id": 2, "title": "Todo 2", "completed": true}
]

// todo
{"id": 1, "title": "Todo 1", "completed": false}
```

## ✅ 테스트 케이스

1. `getTodos` 성공 케이스
2. `getTodo` 성공 케이스
3. 네트워크 에러 케이스
4. 존재하지 않는 ID 요청 케이스

---

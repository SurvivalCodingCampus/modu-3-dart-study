// 가짜 데이터 소스 (테스트용)
import 'data_source.dart';

class MockTodoDataSourceImple implements DataSource {
  @override
  Future<List<dynamic>> getList(filePath) async {
    await Future.delayed(Duration(seconds: 1)); // 네트워크 요청처럼 딜레이 추가
    return [
      {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
      {
        "userId": 1,
        "id": 2,
        "title": "quis ut nam facilis et officia qui",
        "completed": false,
      },
      {
        "userId": 1,
        "id": 3,
        "title": "fugiat veniam minus",
        "completed": false,
      },
      {"userId": 1, "id": 4, "title": "et porro tempora", "completed": true},
      {
        "userId": 1,
        "id": 5,
        "title":
            "laboriosam mollitia et enim quasi adipisci quia provident illum",
        "completed": false,
      },
    ];
  }
}

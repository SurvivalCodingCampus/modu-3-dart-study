import 'dart:convert';
import '../todo_datasource.dart';

class MockTodoDatasourceImpl implements TodoDatasource {
  static const String _mockJsonString = r'''
[
  {
    "userId": 1,
    "id": 1,
    "title": "치킨 주문하기",
    "completed": true
  },
  {
    "userId": 1,
    "id": 2,
    "title": "헬스장 등록하고 안 가기",
    "completed": false
  },
  {
    "userId": 2,
    "id": 3,
    "title": "코드리뷰 하기",
    "completed": false
  },
  {
    "userId": 2,
    "id": 4,
    "title": "퇴사 생각 3번 하기",
    "completed": true
  },
  {
    "userId": 3,
    "id": 5,
    "title": "회의 때 끄덕이기",
    "completed": true
  },
  {
    "userId": 3,
    "id": 6,
    "title": "배포 전 커밋 푸시 잊지 않기",
    "completed": false
  }
]
  ''';

  @override
  Future<List<Map<String, dynamic>>> fetchTodos() async {
    final List<dynamic> decoded = json.decode(_mockJsonString);
    return decoded.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}

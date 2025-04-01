import '../todo_datasource.dart';

class MockTodoDatasourceImpl implements TodoDatasource {
  final List<Map<String, dynamic>> _mockData = [
    {"userId": 1, "id": 1, "title": "치킨 주문하기", "completed": true},
    {"userId": 1, "id": 2, "title": "헬스장 등록하고 안 가기", "completed": false},
    {"userId": 1, "id": 3, "title": "플러터 강의 다 듣기", "completed": false},
    {"userId": 2, "id": 4, "title": "퇴사 생각 3번 하기", "completed": true},
    {"userId": 2, "id": 5, "title": "퇴사 결심 다시 미루기", "completed": true},
    {"userId": 3, "id": 6, "title": "카페에서 노트북 열기만 하기", "completed": false},
    {"userId": 3, "id": 7, "title": "심야에 감성 회로 타기", "completed": true},
    {"userId": 3, "id": 8, "title": "안 쓰는 앱 구독 취소하기", "completed": false},
  ];

  @override
  Future<List<Map<String, dynamic>>> fetchTodos() async {
    return Future.value(_mockData);
  }
}

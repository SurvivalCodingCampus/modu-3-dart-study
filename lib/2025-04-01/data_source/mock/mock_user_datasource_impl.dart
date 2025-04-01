import '../user_datasource.dart';

class MockUserDatasourceImpl implements UserDatasource {
  final List<Map<String, dynamic>> _mockData = [
    {"id": 1, "name": "홍길동", "username": "hero123", "email": "gil@example.com"},
    {
      "id": 2,
      "name": "김코딩",
      "username": "flutterGod",
      "email": "kimco@example.com",
    },
    {
      "id": 3,
      "name": "박버그",
      "username": "debugQueen",
      "email": "buggy@example.com",
    },
    {
      "id": 4,
      "name": "이클린",
      "username": "clean_arch",
      "email": "clean@solid.dev",
    },
    {
      "id": 5,
      "name": "최단축",
      "username": "keyshort",
      "email": "ctrlshift@example.com",
    },
    {"id": 6, "name": "정테스터", "username": "unit_king", "email": "test@qa.com"},
    {"id": 7, "name": "윤디자인", "username": "uiux99", "email": "design@figma.kr"},
    {
      "id": 8,
      "name": "장백엔드",
      "username": "server_lord",
      "email": "api@backend.io",
    },
    {"id": 9, "name": "한프론트", "username": "webstar", "email": "html@vue.org"},
    {"id": 10, "name": "심풀스", "username": "minimal99", "email": "sim@ple.com"},
    {
      "id": 11,
      "name": "엄빠찾기",
      "username": "lostchild",
      "email": "help@map.net",
    },
    {"id": 12, "name": "데브유", "username": "dev_you", "email": "self@taught.io"},
  ];

  @override
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    return Future.value(_mockData);
  }
}

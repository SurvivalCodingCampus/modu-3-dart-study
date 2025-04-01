import 'dart:convert';

import '../user_datasource.dart';

class MockUserDatasourceImpl implements UserDatasource {
  static const String _mockJsonString = r'''
[
  {
    "id": 1,
    "name": "홍길동",
    "username": "hero123",
    "email": "gil@example.com",
    "address": {
      "street": "종로길",
      "suite": "101호",
      "city": "서울",
      "zipcode": "12345",
      "geo": {
        "lat": "37.123",
        "lng": "127.456"
      }
    },
    "phone": "010-1234-5678",
    "website": "gildong.kr",
    "company": {
      "name": "조선테크",
      "catchPhrase": "백성을 위한 플랫폼",
      "bs": "정부 혁신 솔루션"
    }
  },
  {
    "id": 2,
    "name": "김코딩",
    "username": "flutterDev",
    "email": "kimco@dev.kr",
    "address": {
      "street": "해운대로",
      "suite": "5층",
      "city": "부산",
      "zipcode": "54321",
      "geo": {
        "lat": "35.158",
        "lng": "129.160"
      }
    },
    "phone": "010-5678-1234",
    "website": "flutter.kr",
    "company": {
      "name": "모바일코딩",
      "catchPhrase": "앱은 코틀린보다 플러터",
      "bs": "모바일 앱 솔루션"
    }
  }
]
  ''';

  @override
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final List<dynamic> decoded = json.decode(_mockJsonString);
    return decoded.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}

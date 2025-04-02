
import 'dart:convert';

import '../album_datasource.dart';

class MockAlbumDatasourceImpl implements AlbumDatasource {
  static const String _mockJsonString = r'''
[
  {
    "userId": 1,
    "id": 1,
    "title": "퇴근길 감성 앨범"
  },
  {
    "userId": 2,
    "id": 2,
    "title": "출근길 분노 앨범"
  },
  {
    "userId": 3,
    "id": 3,
    "title": "야근용 집중 앨범"
  },
  {
    "userId": 4,
    "id": 4,
    "title": "자바스크립트 위로곡"
  },
  {
    "userId": 5,
    "id": 5,
    "title": "C언어 PTSD 극복용"
  },
  {
    "userId": 1,
    "id": 6,
    "title": "혼자 사는 사람의 앨범"
  },
  {
    "userId": 2,
    "id": 7,
    "title": "회의실 몰래 듣기"
  },
  {
    "userId": 3,
    "id": 8,
    "title": "스터디카페 필수 BGM"
  },
  {
    "userId": 4,
    "id": 9,
    "title": "404 Not Found 감성"
  },
  {
    "userId": 5,
    "id": 10,
    "title": "구글 검색창 BGM"
  },
  {
    "userId": 1,
    "id": 11,
    "title": "퇴근길 감성 앨범"
  },
  {
    "userId": 2,
    "id": 12,
    "title": "출근길 분노 앨범"
  },
  {
    "userId": 3,
    "id": 13,
    "title": "야근용 집중 앨범"
  },
  {
    "userId": 4,
    "id": 14,
    "title": "자바스크립트 위로곡"
  },
  {
    "userId": 5,
    "id": 15,
    "title": "C언어 PTSD 극복용"
  },
  {
    "userId": 1,
    "id": 16,
    "title": "혼자 사는 사람의 앨범"
  },
  {
    "userId": 2,
    "id": 17,
    "title": "회의실 몰래 듣기"
  },
  {
    "userId": 3,
    "id": 18,
    "title": "스터디카페 필수 BGM"
  },
  {
    "userId": 4,
    "id": 19,
    "title": "404 Not Found 감성"
  },
  {
    "userId": 5,
    "id": 20,
    "title": "구글 검색창 BGM"
  }
]
  ''';

  @override
  Future<List<Map<String, dynamic>>> fetchAlbums() async {
    final List<dynamic> decoded = json.decode(_mockJsonString);
    return decoded.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}

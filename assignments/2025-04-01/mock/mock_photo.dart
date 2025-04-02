import 'dart:convert';


const String mockPhotoJson = '''
[
  {
    "albumId": 1,
    "id": 1,
    "title": "Sunset over the mountains",
    "url": "https://example.com/photo1.jpg",
    "thumbnailUrl": "https://example.com/thumb1.jpg"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Ocean view",
    "url": "https://example.com/photo2.jpg",
    "thumbnailUrl": "https://example.com/thumb2.jpg"
  },
  {
    "albumId": 2,
    "id": 3,
    "title": "City skyline",
    "url": "https://example.com/photo3.jpg",
    "thumbnailUrl": "https://example.com/thumb3.jpg"
  },
  {
    "albumId": 2,
    "id": 4,
    "title": "Forest trail",
    "url": "https://example.com/photo4.jpg",
    "thumbnailUrl": "https://example.com/thumb4.jpg"
  },
  {
    "albumId": 3,
    "id": 5,
    "title": "Snowy mountain peak",
    "url": "https://example.com/photo5.jpg",
    "thumbnailUrl": "https://example.com/thumb5.jpg"
  }
]
''';

/// JSON 문자열을 Dart 리스트로 변환하는 함수
List<Map<String, dynamic>> getMockPhotos() {
  return List<Map<String, dynamic>>.from(jsonDecode(mockPhotoJson));
}
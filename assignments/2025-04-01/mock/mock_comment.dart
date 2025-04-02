import 'dart:convert';

const String mockJsonData = '''
[
  {
    "postId": 1,
    "id": 1,
    "name": "Alice",
    "email": "alice@example.com",
    "body": "This is Alice's comment."
  },
  {
    "postId": 1,
    "id": 2,
    "name": "Bob",
    "email": "bob@example.com",
    "body": "Bob's thoughts on this post."
  },
  {
    "postId": 2,
    "id": 3,
    "name": "Charlie",
    "email": "charlie@example.com",
    "body": "Charlie's comment about another topic."
  },
  {
    "postId": 2,
    "id": 4,
    "name": "David",
    "email": "david@example.com",
    "body": "David shares his insights here."
  },
  {
    "postId": 3,
    "id": 5,
    "name": "Eve",
    "email": "eve@example.com",
    "body": "Eve's perspective on this discussion."
  }
]
''';

/// JSON 문자열을 Dart 리스트로 변환하는 함수
List<Map<String, dynamic>> getMockComments() {
  return List<Map<String, dynamic>>.from(jsonDecode(mockJsonData));
}
import 'package:modu_3_dart_study/2025-04-01/data_source/comment_data_source.dart';

// Mock CommentDataSource 구현
class MockCommentDataSource implements CommentDataSource {

  @override
  Future<List<Map<String, dynamic>>> getAllComments() async {
    return [
      {
        "postId": 1,
        "id": 1,
        "name": "Test Name",
        "email": "test@example.com",
        "body": "Test body"
      },
      {
        "postId": 2,
        "id": 2,
        "name": "Another Name",
        "email": "another@example.com",
        "body": "Another body"
      }
    ];
  }
}
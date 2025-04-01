import '../data_source/comment_data_source.dart';
import 'mock.dart';

/// 파일 없이 메모리에서 목 데이터를 제공하는 DataSource
class MockCommentDataSource implements CommentDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchComments(int postId) async {
    final allComments = getMockComments();
    return allComments.where((comment) => comment['postId'] == postId).toList();
  }
}
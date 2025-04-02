import '../../model/comment.dart';

abstract class MockCommentDatasource {
  Future<List<Comment>> getMockComments(int postId);
}
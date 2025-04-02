// CommentDataSource 인터페이스 정의
abstract class CommentDataSource {
  Future<List<Map<String, dynamic>>> getAllComments();
}

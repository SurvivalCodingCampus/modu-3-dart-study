import '../model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComment(int postId);
}

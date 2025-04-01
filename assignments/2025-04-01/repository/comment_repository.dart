import '../model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
  // Future<Comment> getComment(int id);
}

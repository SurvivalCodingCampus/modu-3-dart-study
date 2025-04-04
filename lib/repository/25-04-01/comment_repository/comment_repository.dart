import '../../../model/25-04-01/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}

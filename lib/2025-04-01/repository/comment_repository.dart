
import '../model/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments(int postId);

}
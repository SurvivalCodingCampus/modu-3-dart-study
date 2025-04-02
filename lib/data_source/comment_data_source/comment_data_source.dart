import '../../model/comment.dart';

abstract interface class CommentDataSource {
  Future<List<Comment>> getComments();
}

import '../../../model/25-04-01/comment.dart';

abstract interface class CommentDataSource {
  Future<List<Comment>> getComments();
}

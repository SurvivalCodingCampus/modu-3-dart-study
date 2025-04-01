import '../data_source/comment_data_source.dart';
import '../model/comment.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl({required CommentDataSource commentDataSource})
    : _commentDataSource = commentDataSource;

  @override
  Future<List<Comment>> getComments(int postId) async {
    final comments = await _commentDataSource.getComments();
    return comments
        .map((e) => Comment.fromJson(e))
        .where((e) => e.postId == postId)
        .toList();
  }
}

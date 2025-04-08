import '../model/comment.dart';
import 'comment_data_source.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  @override
  Future<List<Comment>> getComments(int postId) async {
    List<Comment> commentList = [];
    final List<Map<String, dynamic>> fetchData =
        await _commentDataSource.fetchComments();
    if (fetchData.isNotEmpty) {
      fetchData.map((item) {
        if (item["postId"] == postId) {
          commentList.add(Comment.fromMap(item));
        }
      }).toList();
    }

    return commentList;
  }

  CommentRepositoryImpl({required CommentDataSource commentDataSource})
    : _commentDataSource = commentDataSource;
}

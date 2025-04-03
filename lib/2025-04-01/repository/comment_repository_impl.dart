import '../data_source/comment_data_source.dart';
import '../model/comment.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource commentDataSource;

  CommentRepositoryImpl(this.commentDataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    try {
      final commentsJson = await commentDataSource.fetchComments(postId);
      return _mapToComments(commentsJson);
    } catch (e) {
      throw Exception('Failed to fetch comments: $e');
    }
  }

  List<Comment> _mapToComments(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => Comment.fromJson(e)).toList();
  }
}
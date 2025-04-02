import '../data_source/comment_data_source.dart';
import '../model/comment.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl(this._commentDataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    final jsonList = await _commentDataSource.getComments();

    final List<Comment> commentList =
        jsonList
            .map((e) => Comment.fromJson(e))
            .where((map) => map.postId == postId)
            .toList();

    return commentList;
  }

  @override
  Future<Comment> getComment(int id) async {
    final List<Map<String, dynamic>> jsonList =
        await _commentDataSource.getComments();

    final List<Comment> commentList =
        jsonList.map((e) => Comment.fromJson(e)).toList();

    final comment = commentList.singleWhere((map) => map.id == id);

    return comment;
  }
}

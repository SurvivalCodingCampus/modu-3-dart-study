import '../data_source/comment_data_source.dart';
import '../model/comment.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _dataSource;

  CommentRepositoryImpl(this._dataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    final resp = await _dataSource.getComments();
    final comments =
        resp
            .map((e) => Comment.fromJson(e))
            .where((e) => e.postId == postId)
            .toList();
    return comments;
  }
}

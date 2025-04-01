import '../data_source/comment_datasource.dart';
import '../model/comment.dart';
import 'interface/commentRepository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDatasource _datasource;

  CommentRepositoryImpl(this._datasource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    final raw = await _datasource.fetchComments();
    return raw
        .where((e) => e['postId'] == postId)
        .map((e) => Comment.fromJson(e))
        .toList();
  }
}

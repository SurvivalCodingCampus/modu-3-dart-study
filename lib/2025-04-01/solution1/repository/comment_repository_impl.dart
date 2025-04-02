import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/model/comment.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {

  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl(this._commentDataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    final commentData = await _commentDataSource.getComments();
    return commentData
        .map((e) => Comment.fromJson(e))
        .where((e) => e.postId == postId)
        .toList();
  }
}
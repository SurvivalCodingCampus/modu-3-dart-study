// MockCommentDatasourceimpl
// CommentRepositoryimpl
// Future<List<Comment>>getComments(int postid)

import 'package:modu_3_dart_study/model/25-04-01/comment.dart';

import '../../../data_source/25-04-01/comment_data_source/comment_data_source.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource dataSource;
  CommentRepositoryImpl({required this.dataSource});
  @override
  Future<List<Comment>> getComments(int postId) async {
    final allComments = await dataSource.getComments();
    return allComments;
  }
}

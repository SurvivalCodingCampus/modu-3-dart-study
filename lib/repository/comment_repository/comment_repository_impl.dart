// MockCommentDatasourceimpl
// CommentRepositoryimpl
// Future<List<Comment>>getComments(int postid)

import 'package:modu_3_dart_study/data_source/comment_data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/model/comment.dart';
import 'package:modu_3_dart_study/repository/comment_repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource dataSource;
  CommentRepositoryImpl({required this.dataSource});
  @override
  Future<List<Comment>> getComments(int postId) async {
    final allComments = await dataSource.getComments();
    return allComments;
  }
}

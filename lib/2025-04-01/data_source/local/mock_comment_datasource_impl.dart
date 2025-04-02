import 'package:modu_3_dart_study/2025-04-01/repository/comment_repository_impl.dart';

import '../../model/comment.dart';
import 'mock_comment_datasource.dart';

class MockCommentDatasourceImpl implements MockCommentDatasource {
  final CommentRepositoryImpl commentRepoImpl;

  MockCommentDatasourceImpl(this.commentRepoImpl);

  @override
  Future<List<Comment>> getMockComments(int postId) async {
    return await commentRepoImpl.getComments(postId);
  }
}

import 'package:modu_3_dart_study/PR2025-04-01/comments/data_source/comment_data_source_impl.dart';
import 'package:modu_3_dart_study/PR2025-04-01/comments/model/comment.dart';
import 'package:modu_3_dart_study/PR2025-04-01/comments/repository/comment_repository_impl.dart';
import 'package:test/test.dart';

void main() async {
  group('comments.json 테스트', () {
    test('postId가  99 일때 확인', () async {
      const postId = 99;
      CommentRepositoryImpl commentRepositoryImpl = CommentRepositoryImpl(
        commentDataSource: CommentDataSourceImpl(),
      );
      List<Comment> comments = await commentRepositoryImpl.getCommentsByPostId(
        postId,
      );
      expect(comments.length, 5);
      for (int i = 0; i < comments.length; i++) {
        expect(comments[i].postId, postId);
      }
    });
  });
}

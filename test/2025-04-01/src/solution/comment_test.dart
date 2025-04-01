import 'package:test/test.dart';

import '../../../../assignments/2025-04-01/src/solution/data_source/comment_data_source_impl.dart';
import '../../../../assignments/2025-04-01/src/solution/model/comment.dart';
import '../../../../assignments/2025-04-01/src/solution/repository/comment_repository.dart';
import '../../../../assignments/2025-04-01/src/solution/repository/comment_repository_impl.dart';
import 'mock/mock_comment_data_source_impl.dart';

void main() {
  group('Comment', () {
    test('문제 1번', () async {
      final CommentRepository repository = CommentRepositoryImpl(
        commentDataSource: CommentDataSourceImpl(),
      );

      final expected =
          await MockCommentDataSourceImpl()
              .getComments(); // postId가 1인 comment만 담겨있는 리스트

      final result = await repository.getComments(
        1,
      ); // 전체 리스트에서 postId가 1인것만 추출

      for (int i = 0; i < expected.length; i++) {
        expect(result[i], isA<Comment>());
        expect(result[i].postId, expected[i]['postId']);
        expect(result[i].id, expected[i]['id']);
        expect(result[i].name, expected[i]['name']);
        expect(result[i].email, expected[i]['email']);
        expect(result[i].body, expected[i]['body']);
      }

      expect(result.length, expected.length);
    });
  });
}

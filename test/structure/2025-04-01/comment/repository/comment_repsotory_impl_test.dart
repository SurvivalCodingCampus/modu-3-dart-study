import 'package:test/test.dart';
import '../../../../../lib/assignments/structure/2025-04-01/comment/data_source/local/comment_data_source_impl.dart';
import '../../../../../lib/assignments/structure/2025-04-01/comment/repository/comment_repository.dart';
import '../../../../../lib/assignments/structure/2025-04-01/comment/repository/comment_repository_impl.dart';
import '../../../../../lib/assignments/structure/2025-04-01/comment/repository/mock/mock_comment_repository_impl.dart';

void main() {
  group('comment repo test', () {
    test('comment mock repo test', () async {
      final CommentRepository repo = MockCommentRepositoryImpl();
      final data = await repo.getComments(1);

      // 내부에 있는 객체의 albumId가 모두 1인지 확인
      expect(
        data.length,
        equals(3),
      );
    });

    test('comment repo test', () async {
      final CommentRepository repo = CommentRepositoryImpl(
        CommentDataSourceImpl(),
      );
      final comments = await repo.getComments(1);

      print(comments[0].toString());

      // 내부에 있는 객체의 albumId가 모두 1인지 확인
      expect(
        comments.length == comments.where((e) => e.postId == 1).toList().length,
        equals(true),
      );
    });
  });
}

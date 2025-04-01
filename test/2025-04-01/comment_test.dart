import 'package:test/test.dart';

import '../../assignments/2025-04-01/comment/data_source/impl/comment_data_source_impl.dart';
import '../../assignments/2025-04-01/comment/model/comment.dart';
import '../../assignments/2025-04-01/comment/repository/comment_repository.dart';
import '../../assignments/2025-04-01/comment/repository/impl/comment_repository_impl.dart';

void main() {
  final CommentRepository commentRepository = CommentRepositoryImpl(
    CommentDataSourceImpl(),
    Comment(),
  );
  const String fileName = 'comments.json';
  const String wrongFileName = 'comments2.json';

  group('댓글 : ', () {
    test('postId 로 구분된 댓글 목록 가져오기', () async {
      print(await commentRepository.getItemsByKey(1, fileName));
    });
    test('postId 로 구분된 댓글 목록 가져오기 실패', () async {
      expect(
        () async => await commentRepository.getItemsByKey(1, wrongFileName),
        throwsA(isArgumentError),
      );
    });
  });
}

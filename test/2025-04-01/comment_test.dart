import 'package:test/test.dart';

import '../../assignments/2025-04-01/comment/model/comment.dart';
import '../../assignments/2025-04-01/comment/repository/comment_repository.dart';
import '../../assignments/2025-04-01/comment/repository/impl/comment_repository_impl.dart';
import 'mock/mock_comment_data_source.dart';

void main() {
  late MockCommentDataSource commentDataSource;
  late CommentRepository commentRepository;
  late Comment comment;

  group('댓글 : ', () {
    setUpAll(() {
      commentDataSource = MockCommentDataSource();
      comment = Comment();
      commentRepository = CommentRepositoryImpl(commentDataSource, comment);

      commentDataSource.setMockData('comments.json', [
        {
          'postId': 1,
          'id': 1,
          'name': 'comment 1',
          'email': 'wpghks@n.d',
          'body': 'etc',
        },
        {
          'postId': 1,
          'id': 2,
          'name': 'comment 2',
          'email': 'wpghks@n.d',
          'body': 'etc 2',
        },
        {
          'postId': 2,
          'id': 3,
          'name': 'comment 3',
          'email': 'wpghks@n.d',
          'body': 'etc 3',
        },
      ]);
    });
    test('postId 로 구분된 댓글 목록 가져오기', () async {
      final List<Comment> comments = await commentRepository.getItemsByKey(
        1,
        'comments.json',
      );

      expect(comments.length, 2);
      expect(comments.first.id, 1);
      expect(comments.first.body, 'etc');
    });
    test('postId 로 구분된 댓글 목록 가져오기 실패', () async {
      expect(
        () async => await commentRepository.getItemsByKey(1, 'comments2.json'),
        throwsA(isArgumentError),
      );
    });
  });
}

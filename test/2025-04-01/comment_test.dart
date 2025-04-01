import 'package:test/test.dart';

import '../../assignments/2025-04-01/data_source/mock_comment_data_source_impl.dart';
import '../../assignments/2025-04-01/model/comment.dart';
import '../../assignments/2025-04-01/repository/comment_repository_impl.dart';

void main() {
  final mockCommentDataSource = MockCommentDataSourceImple();
  group('예제1) comment', () {
    test('mock 테스트', () async {
      final commentRepository = CommentRepositoryImpl(mockCommentDataSource);
      List<Comment> comments = await commentRepository.getComment(1);

      expect(comments.length, 2);

      expect(comments[0].postId, 1);
      expect(comments[0].id, 1);
      expect(comments[0].name, 'id labore ex et quam laborum');
      expect(comments[0].email, 'Eliseo@gardner.biz');
      expect(
        comments[0].body,
        '''laudantium enim quasi est quidem magnam voluptate ipsam eos
tempora quo necessitatibus
dolor quam autem quasi
reiciendis et nam sapiente accusantium''',
      );

      expect(comments[1].postId, 1);
      expect(comments[1].id, 2);
      expect(comments[1].name, 'quo vero reiciendis velit similique earum');
      expect(comments[1].email, 'Jayne_Kuhic@sydney.com');
      expect(
        comments[1].body,
        '''est natus enim nihil est dolore omnis voluptatem numquam
et omnis occaecati quod ullam at
voluptatem error expedita pariatur
nihil sint nostrum voluptatem reiciendis et''',
      );
    });
  });
}

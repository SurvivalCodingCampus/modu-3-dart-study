import 'package:test/test.dart';

import '../../assignments/2025-04-01/data_source/mock_comment_data_source_impl.dart';
import '../../assignments/2025-04-01/model/comment.dart';
import '../../assignments/2025-04-01/repository/comment_repository_impl.dart';

void main() {
  group('목데이터 테스트', () {
    MockCommentDataSourceImpl mockCommentDataSourceImpl =
        MockCommentDataSourceImpl();
    CommentRepositoryImpl commentRepositoryImpl = CommentRepositoryImpl(
      dataSource: mockCommentDataSourceImpl,
    );
    test('목데이터 테스트', () async {
      List<Map<String, dynamic>> listMap =
          await mockCommentDataSourceImpl.getAllComments();
      expect(
        listMap[0].toString(),
        '''{postId: 1, id: 1, name: id labore ex et quam laborum, email: Eliseo@gardner.biz, body: laudantium enim quasi est quidem magnam voluptate ipsam eos
tempora quo necessitatibus
dolor quam autem quasi
reiciendis et nam sapiente accusantium}''',
      );
      List<Comment> comments = await commentRepositoryImpl.getComments(1);
      expect(
        comments[0].toString(),
        '''Comment(postId: 1, id: 1, name: id labore ex et quam laborum, email: Eliseo@gardner.biz, body: laudantium enim quasi est quidem magnam voluptate ipsam eos
tempora quo necessitatibus
dolor quam autem quasi
reiciendis et nam sapiente accusantium)''',
      );
    });
  });
  

}

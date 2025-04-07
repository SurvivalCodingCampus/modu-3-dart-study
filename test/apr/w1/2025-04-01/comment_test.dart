import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../playground/apr/w1/2025-04-01/comment/data_source/mock_comment_data_source_impl.dart';
import '../../../../playground/apr/w1/2025-04-01/comment/repository/comment_repository_impl.dart';

void main() {
  test('comment', () async {
    final repository = await CommentRepositoryImpl(MockCommentDataSourceImpl());
    final commentData = await repository.getComments(1);

    expect(commentData[0].postId, equals(1));
    expect(commentData.length, equals(5));
  });
}

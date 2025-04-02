import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/model/comment.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/repository/comment_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/repository/comment_repository_impl.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

import '../mock/mock_comment_data_source_impl.dart';

void main() {
  test('postId가 1인 Comment 찾기', () async {
    final CommentRepository commentRepository = CommentRepositoryImpl(CommentDataSourceImpl());
    List<Comment> commentList = await commentRepository.getComments(1);

    expect(commentList.any((e) => e.postId != 1), isFalse);
  });
  test('postId가 1인 Comment 찾기', () async {
    final CommentRepository commentRepository = CommentRepositoryImpl(MockCommentDataSourceImpl());
    List<Comment> commentList = await commentRepository.getComments(1);

    expect(commentList.any((e) => e.postId != 1), isFalse);
  });
}

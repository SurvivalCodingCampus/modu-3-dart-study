import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/mock_comment_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/model/comment.dart';
import 'package:test/test.dart';

void main() async {
  test('1. MockTypeTest', () async {
    CommentRepositoryImpl commentRepositoryImpl = CommentRepositoryImpl(
      commentDataSource: MockCommentDataSourceImpl(),
    );

    List<Comment> commentRepositoryList = await commentRepositoryImpl
        .getComments(1);

    expect(commentRepositoryList.length, equals(5));
  });

  test('2. RealDataTest', () async {
    CommentRepositoryImpl commentRepositoryImpl = CommentRepositoryImpl(
      commentDataSource: CommentDataSourceImpl(
        path: 'lib/2025-04-01/solution1/data_source/comments.json',
      ),
    );

    List<Comment> commentRepositoryList = await commentRepositoryImpl
        .getComments(1);

    expect(commentRepositoryList.length, equals(5));
  });
}

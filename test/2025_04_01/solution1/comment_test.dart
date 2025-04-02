import 'package:test/test.dart';

import '../../../assignments/2025_04_01/solution1/data_source/comment_data_source_impl.dart';

import '../../../assignments/2025_04_01/solution1/mock/mock_comment_data_source_impl.dart';
import '../../../assignments/2025_04_01/solution1/repository/comment_repository.dart';
import '../../../assignments/2025_04_01/solution1/repository/comment_repository_impl.dart';

void main() {
  group('Data Source', () {
    final commentDataSource = CommentDataSourceImpl();
    test('Data Source 제대로 잘 가져오는지 확인', () async {
      final result = await commentDataSource.getComments();

      expect(result.length, 500);
    });
  });

  group('Repository', () {
    final CommentRepository commentRepository = CommentRepositoryImpl(
      CommentDataSourceImpl(),
    );
    test('Repository getComment id 비교', () async {
      final commentId = 40;
      final result = await commentRepository.getComment(commentId);
      print(result);
      expect(result.id, commentId);
    });

    test('Repository getComments postId 해당하는 Data length', () async {
      final commentPostId = 1;
      final results = await commentRepository.getComments(commentPostId);

      expect(results.length, 5);
    });

    group('Mock Data', () {
      final mockCommentDataSource = MockCommentDataSourceImpl();
      test('Mock data test', () async {
        final result = await mockCommentDataSource.getComments();

        print(result);
        expect(result.length, 2);
      });
    });
  });
}

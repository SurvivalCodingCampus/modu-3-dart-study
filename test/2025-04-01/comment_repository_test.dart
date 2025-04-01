import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_comment_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/comment_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/interface/commentRepository.dart';
import 'package:test/test.dart';

void main() {
  late CommentRepository repository;

  // 테스트용 상수
  const int postIdWithExpectedComments = 1;
  const int postIdWithNoComments = 999;

  setUp(() {
    repository = CommentRepositoryImpl(MockCommentDatasourceImpl());
    // 실제 로컬 파일 사용 시
    // repository = CommentRepositoryImpl(CommentLocalDatasourceImpl());
  });

  group('CommentRepository 공통 테스트', () {
    test('postId로 조회한 댓글은 모두 해당 postId를 가져야 함', () async {
      final List<Comment> comments = await repository.getComments(
        postIdWithExpectedComments,
      );

      print('▶ 총 ${comments.length}개의 댓글이 조회됨');
      for (final comment in comments) {
        print(
          ' - [id: ${comment.id}] postId: ${comment.postId}, name: ${comment.name}',
        );
      }

      expect(comments, isA<List<Comment>>());
      expect(
        comments.every((e) => e.postId == postIdWithExpectedComments),
        isTrue,
      );

      print('✅ postId 필터링 테스트 통과\n');
    });

    test('존재하지 않는 postId는 빈 리스트를 반환해야 함', () async {
      final List<Comment> comments = await repository.getComments(
        postIdWithNoComments,
      );

      print('▶ postId: $postIdWithNoComments에 대한 결과: ${comments.length}개');
      if (comments.isEmpty) {
        print('✅ 빈 리스트 확인 완료\n');
      } else {
        print('❌ 예상과 달리 결과가 존재함!');
        for (final c in comments) {
          print(' - [id: ${c.id}] postId: ${c.postId}, name: ${c.name}');
        }
      }

      expect(comments, isEmpty);
    });
  });
}

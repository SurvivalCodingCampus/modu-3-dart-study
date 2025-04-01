import 'package:test/test.dart';
import '../../assignments/2025-04-01/data_source/comment_data_source.dart';
import '../../assignments/2025-04-01/data_source/comment_data_source_impl.dart';
import '../../assignments/2025-04-01/mock/mock_comment.dart';
import '../../assignments/2025-04-01/model/comment.dart';
import '../../assignments/2025-04-01/repository/comment_repository_impl.dart';

/// Mock 데이터 소스 구현
class MockCommentDataSource implements CommentDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchComments(int postId) async {
    final allComments = getMockComments();
    return allComments.where((comment) => comment['postId'] == postId).toList();
  }
}

void main() {
  late CommentRepositoryImpl repository;
  late MockCommentDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockCommentDataSource();
    repository = CommentRepositoryImpl(mockDataSource);
  });

  test('postId 1의 댓글을 올바르게 가져와야 함', () async {
    final comments = await repository.getComments(1);

    expect(comments, isA<List<Comment>>()); // List<Comment> 타입 확인
    expect(comments.length, equals(2)); // postId 1에 해당하는 댓글 개수
    expect(comments.first.name, equals("Alice")); // 첫 번째 댓글의 name 확인
  });

  test('postId 2의 댓글을 올바르게 가져와야 함', () async {
    final comments = await repository.getComments(2);

    expect(comments, isA<List<Comment>>());
    expect(comments.length, equals(2));
    expect(comments.first.name, equals("Charlie"));
  });

  test('존재하지 않는 postId (99)에 대한 댓글 요청 시 빈 리스트 반환', () async {
    final comments = await repository.getComments(99);

    expect(comments, isEmpty);
  });
}

// import 'dart:io';

// void main() {
//   late CommentRepositoryImpl repository;
//   late CommentDataSourceImpl dataSource;

//   setUp(() {
//     // 실제 JSON 파일 경로 (테스트 환경에 맞게 수정)
//     const filePath = '/Users/roychoi/Documents/GitHub/flutter-study/assignments/2025-04-01/data/comments.json';
//     dataSource = CommentDataSourceImpl(filePath: filePath);
//     repository = CommentRepositoryImpl(dataSource);
//   });

//   test('postId 1의 댓글을 올바르게 가져와야 함', () async {
//     final comments = await repository.getComments(1);

//     expect(comments, isA<List<Comment>>()); // List<Comment> 타입 확인
//     expect(comments.isNotEmpty, isTrue); // 데이터가 비어있지 않아야 함
//     print(comments); // 테스트 실행 시 출력 확인
//   });

//   test('postId 99의 댓글 요청 시 빈 리스트 반환', () async {
//     final comments = await repository.getComments(101);

//     expect(comments, isEmpty);
//   });

//   test('comments.json 파일이 올바르게 로드되는지 확인', () async {
//     final file = File('/Users/roychoi/Documents/GitHub/flutter-study/assignments/2025-04-01/data/comments.json');
//     final content = await file.readAsString();

//     expect(content.isNotEmpty, isTrue); // 파일이 존재하고 내용이 있어야 함
//   });
// }
import 'package:test/test.dart';
import 'dart:io';
import 'package:modu_3_dart_study/2025-04-01/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/comment_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/mock/mock_comment_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/comment_repository_impl.dart';

/// 데이터 소스 팩토리 - Mock 또는 실제 구현체 생성
CommentDataSource getDataSource(bool useMock) {
  if (useMock) {
    return MockCommentDataSource();
  } else {
    // 상대 경로 사용 - 어떤 환경에서도 작동
    final String filePath = 'package:modu_3_dart_study/2025-04-01/data/comments.json';
    return CommentDataSourceImpl(filePath: filePath);
  }
}

void main() {
  group('댓글 저장소 테스트', () {
    // 테스트 실행 시 사용할 데이터 소스 타입 쉽게 변경 가능
    const bool useMockData = true; // false로 변경하면 실제 JSON 파일 사용
    
    late CommentRepositoryImpl repository;
    
    setUp(() {
      // 적절한 데이터 소스 선택
      final dataSource = getDataSource(useMockData);
      repository = CommentRepositoryImpl(dataSource);
    });
    
    test('postId 1의 댓글을 올바르게 가져와야 함', () async {
      final comments = await repository.getComments(1);
    
      expect(comments, isA<List<Comment>>());
      expect(comments.isNotEmpty, isTrue);
      
      // Mock 데이터일 경우 추가 검증
      if (useMockData) {
        expect(comments.length, equals(2));
        expect(comments.first.name, equals("Alice"));
      }
    });
    
    test('postId 2의 댓글을 올바르게 가져와야 함', () async {
      final comments = await repository.getComments(2);
    
      expect(comments, isA<List<Comment>>());
      
      if (useMockData) {
        expect(comments.length, equals(2));
        expect(comments.first.name, equals("Charlie"));
      } else {
        expect(comments.isNotEmpty, isTrue);
      }
    });
    
    test('존재하지 않는 postId에 대한 댓글 요청 시 빈 리스트 반환', () async {
      final comments = await repository.getComments(99);
      expect(comments, isEmpty);
    });
  });
  
  // 실제 데이터 사용 시에만 파일 존재 확인 테스트 실행
  group('JSON 파일 테스트', () {
    test('comments.json 파일이 올바르게 로드되는지 확인', () async {
      final String filePath = 'package:modu_3_dart_study/2025-04-01/data/comments.json';
      final file = File(filePath);
      expect(await file.exists(), isTrue, reason: '파일이 존재해야 함');
      
      final content = await file.readAsString();
      expect(content.isNotEmpty, isTrue, reason: '파일 내용이 있어야 함');
    });
  });
}
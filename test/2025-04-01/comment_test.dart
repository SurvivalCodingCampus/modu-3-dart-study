import 'package:modu_3_dart_study/2025-04-01/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/local/comment_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/comment_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/comment_repository_impl.dart';
import 'package:test/test.dart';


void main() async {
  final String filePath =
      'C:/dev/DartProjects/modu-3-dart-study/test/2025-04-01/';
  final CommentDataSource commentDataSource = CommentDataSourceImpl(filePath + 'comments.json');
  final CommentRepository commentRepository = CommentRepositoryImpl(commentDataSource);
  final List<Comment> comments = await commentRepository.getComments(2);

  for (Comment comment in comments) {
    print(comment);
  }
}

/*
void main() async {
  group('[ Comment Model Class ] - ', () {
    test('fromJson() 를 통해 comment 객체가 생성 되어야 한다.', () {
      final jsonData = {
        "postId": 1,
        "id": 1,
        "name": "Test Name",
        "email": "test@example.com",
        "body": "Test body"
      };
      final comment = Comment.fromJson(jsonData);

      expect(comment.postId, 1);
      expect(comment.id, 1);
      expect(comment.name, "Test Name");
      expect(comment.email, "test@example.com");
      expect(comment.body, "Test body");
    });

    test('toJson() 를 통해 JsonMap이 나와야 한다.', () {
      final comment = Comment(
        postId: 1,
        id: 1,
        name: "Test Name",
        email: "test@example.com",
        body: "Test body",
      );
      final jsonMap = comment.toJson();

      expect(jsonMap["postId"], 1);
      expect(jsonMap["id"], 1);
      expect(jsonMap["name"], "Test Name");
      expect(jsonMap["email"], "test@example.com");
      expect(jsonMap["body"], "Test body");
    });
  });


  group('[ CommentRepository Class ] - ', () {

    test('getComments()는 postId 해당 하는 comment를 리턴 한다.', () async {
      MockCommentDataSource mockCommentDataSource = MockCommentDataSource();
      CommentRepository commentRepository = CommentRepositoryImpl(mockCommentDataSource);

      final comments = await commentRepository.getComments(1);

      expect(comments.length, 1);
      expect(comments.first.postId, 1);
      expect(comments.first.name, "Test Name");
    });
  });
}
*/
import 'package:modu_3_dart_study/2025-04-01/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/comment_repository.dart';

// CommentRepository 구현 클래스
class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource dataSource;

  CommentRepositoryImpl(this.dataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    final jsonData = await dataSource.getAllComments();
    return jsonData
        .map((json) => Comment.fromJson(json))
        .where((comment) => comment.postId == postId)
        .toList();
  }
}



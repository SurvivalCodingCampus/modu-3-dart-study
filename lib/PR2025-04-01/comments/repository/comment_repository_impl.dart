import 'package:modu_3_dart_study/PR2025-04-01/comments/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-01/comments/model/comment.dart';
import 'package:modu_3_dart_study/PR2025-04-01/comments/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  //데이터 소스 파일 불러오기
  CommentDataSource dataSource = CommentDataSource();

  @override
  Future<List<Comment>> getCommentsByPostId(int postId) async {
    List<Comment> allComments = await dataSource.getComments();
    List<Comment> selectedComments =
        allComments.where((e) => e.postId == postId).toList();
    return selectedComments;
  }
}

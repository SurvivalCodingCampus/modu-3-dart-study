import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/model/comment.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  @override
  Future<List<Comment>> getComments(int postId) async {
    List<Comment> commentList = [];
    final List<Map<String, dynamic>> fetchData =
        await _commentDataSource.fetchComments();
    if (fetchData.isNotEmpty) {
      fetchData.map((item) {
        if (item["postId"] == postId) {
          commentList.add(Comment.fromMap(item));
        }
      }).toList();
    }

    return commentList;
  }

  CommentRepositoryImpl({required CommentDataSource commentDataSource})
    : _commentDataSource = commentDataSource;
}

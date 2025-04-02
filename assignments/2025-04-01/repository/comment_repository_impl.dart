import 'dart:io';

import '../data_source/data_source.dart';
import '../data_source/date_source_impl.dart';
import '../data_source/mock_comment_data_source_impl.dart';
import '../model/comment.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final DataSource _commentDataSource;
  const CommentRepositoryImpl(this._commentDataSource);

  @override
  Future<List<Comment>> getComment(int postId) async {
    try {
      final filePath =
          '${Directory.current.path}/assignments/2025-04-01/comment.json';
      List<dynamic> jsonList = await _commentDataSource.getList(filePath);

      return jsonList
          .map((json) => Comment.fromJson(json))
          .where((e) => e.postId == postId)
          .toList();
    } catch (e) {
      print('예상치 못한 오류 발생: $e');
      return [];
    }
  }
}

void main() async {
  final mockCommentDataSource = MockCommentDataSourceImpl();
  final commentDataSource = DataSourceImpl();
  final commentRepository = CommentRepositoryImpl(commentDataSource);

  List<Comment> comments = await commentRepository.getComment(2);

  print(comments);
}

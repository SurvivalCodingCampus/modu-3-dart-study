import '../data_source/comment_data_source.dart';
import '../model/comment.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _dataSource;

  const CommentRepositoryImpl({required CommentDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Comment>> getComments(int postId) async {
    List<Map<String, dynamic>> jsonMap = await _dataSource.getAllComments();
    List<Comment> allComments =
        jsonMap.map((e) => Comment.fromJson(e)).toList();
    return allComments.where((element) => element.postId == postId,).toList();
  }
}

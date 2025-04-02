import '../model/comment.dart';

abstract interface class CommentDataSource {
  Future<List<Map<String, dynamic>>> getComments();
}
import 'package:modu_3_dart_study/PR2025-04-01/comments/model/comment.dart';

abstract interface class CommentDataSource {
  Future<List<Comment>> getComments();
}

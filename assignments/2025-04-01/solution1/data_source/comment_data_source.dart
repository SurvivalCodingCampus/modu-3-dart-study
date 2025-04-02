import 'package:modu_3_dart_study/2025-04-01/solution1/model/comment.dart';

abstract interface class CommentDataSource {
  Future<List<Map<String, dynamic>>> fetchComments();
}

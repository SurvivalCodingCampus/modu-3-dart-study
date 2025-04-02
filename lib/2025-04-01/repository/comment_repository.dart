
import 'package:modu_3_dart_study/2025-04-01/model/comment.dart';

// CommentRepository 인터페이스 정의
abstract class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}
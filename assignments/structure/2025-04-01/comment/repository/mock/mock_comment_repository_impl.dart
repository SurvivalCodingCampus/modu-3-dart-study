import '../../model/comment.dart';
import '../comment_repository.dart';

class MockCommentRepositoryImpl implements CommentRepository {
  @override
  Future<List<Comment>> getComments(int postId) async {
    final data = [
      Comment(postId: 1, id: 2, name: 'name', email: 'email', body: 'body'),
      Comment(postId: 1, id: 2, name: 'name', email: 'email', body: 'body'),
      Comment(postId: 1, id: 2, name: 'name', email: 'email', body: 'body'),
      Comment(postId: 2, id: 2, name: 'name', email: 'email', body: 'body'),
      Comment(postId: 2, id: 2, name: 'name', email: 'email', body: 'body'),
      Comment(postId: 2, id: 2, name: 'name', email: 'email', body: 'body'),
    ];
    final comments = data.where((e) => e.postId == postId).toList();
    return comments;
  }
}
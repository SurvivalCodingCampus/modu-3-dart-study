import 'package:modu_3_dart_study/2025-04/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';
import 'package:modu_3_dart_study/2025-04/repository.dart';

class CommentRepository implements Repository<Comment, int> {
  final DataSource<Comment> _source;

  const CommentRepository(this._source);

  @override
  Future<List<Comment>> findAll() async {
    return await _source.load();
  }

  @override
  Future<Comment> findOne(int postId) async {
    List<Comment> comments = await _source.load();
    return comments.firstWhere((e) => e.postId == postId);
  }

  Future<List<Comment>> getComments(int postId) async {
    List<Comment> comments = await _source.load();
    return comments.where((e) => e.postId == postId).toList();
  }
}

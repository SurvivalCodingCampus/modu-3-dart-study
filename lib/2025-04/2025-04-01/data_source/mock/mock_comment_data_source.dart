import 'package:modu_3_dart_study/2025-04/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class MockCommentDataSource implements DataSource<Comment> {
  @override
  Future<List<Comment>> load() async {
    return [
      Comment(
        postId: 1,
        id: 1,
        name: 'Dart',
        body: 'Dart',
        email: 'example@example.net',
      ),
      Comment(
        postId: 1,
        id: 1,
        name: 'Dart',
        body: 'Dart',
        email: 'example@example.net',
      ),
    ];
  }
}

import 'dart:convert';
import 'dart:io';

import 'comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  @override
  Future<List<Map<String, dynamic>>> getComments() async {
    final file =
        await File(
          'assignments/2025-04-01/src/solution/data_source/local/comments.json',
        ).readAsString();

    final List commentsList = jsonDecode(file);
    return commentsList.map((e) => e as Map<String, dynamic>).toList();
  }
}

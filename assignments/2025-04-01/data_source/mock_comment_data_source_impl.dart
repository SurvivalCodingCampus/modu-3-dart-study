import 'dart:convert';
import 'dart:io';

import 'comment_data_source.dart';

class MockCommentDataSourceImpl implements CommentDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAllComments() async {
    String jsonString =
        await File(
          'assignments/2025-04-01/data_source/mock_comments.json',
        ).readAsString();
    List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => e as Map<String, dynamic>).toList();
  }
}

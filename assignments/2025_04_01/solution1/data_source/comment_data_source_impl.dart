import 'dart:convert';
import 'dart:io';

import 'comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  final jsonFile = File('assets/json/2025_04_01/comment.json');
  @override
  Future<List<Map<String, dynamic>>> getComments() async {
    final jsonString = await jsonFile.readAsString();

    final List comments = jsonDecode(jsonString);

    return comments.map((e) => e as Map<String, dynamic>).toList();
  }
}

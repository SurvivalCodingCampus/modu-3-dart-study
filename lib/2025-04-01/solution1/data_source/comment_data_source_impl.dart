import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  final File file = File('lib/2025-04-01/solution1/comments.json');

  @override
  Future<List<Map<String, dynamic>>> getComments() async {
    final String fileString = await file.readAsString();
    final List<dynamic> jsonList = jsonDecode(fileString);

    return jsonList
        .map((dynamic e) => e as Map<String,dynamic>) // 굳이 명시함
        .toList();
  }
}
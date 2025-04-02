import 'dart:convert';
import 'dart:io';

import '../comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchComments(String path) async {
    final jsonString = await File(path).readAsString();
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}

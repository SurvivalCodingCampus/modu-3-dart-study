import 'dart:convert';
import 'dart:io';

import 'comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  final String path;

  CommentDataSourceImpl({required this.path});

  @override
  Future<List<Map<String, dynamic>>> getAllComments() async {
    String jsonString = await File(path).readAsString();
    List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => e as Map<String, dynamic>).toList();
  }
}

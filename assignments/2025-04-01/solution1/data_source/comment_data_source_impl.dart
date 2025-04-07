import 'dart:convert';
import 'dart:io';

import 'comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  String path;

  @override
  Future<List<Map<String, dynamic>>> fetchComments() async {
    String dataFile = await File(path).readAsString();
    List fetchData = jsonDecode(dataFile);
    List<Map<String, dynamic>> commentList = [];
    for (Map<String, dynamic> e in fetchData) {
      commentList.add(e);
    }

    return commentList;
  }

  CommentDataSourceImpl({required this.path});
}

import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class CommentDataSource implements DataSource<Comment> {
  @override
  Future<List<Comment>> load({
    String relativePath = '/lib/data/comments.json',
  }) async {
    File file = File(Directory.current.path + relativePath);
    List<Map<String, dynamic>> json = jsonDecode(await file.readAsString());

    return json.map((e) => Comment.fromJson(e)).toList();
  }
}

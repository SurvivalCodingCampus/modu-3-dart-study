import 'dart:convert';
import 'dart:io';
import '../comment_datasource.dart';

class CommentLocalDatasourceImpl implements CommentDatasource {
  final String filePath;

  CommentLocalDatasourceImpl({
    this.filePath = 'lib/2025-04-01/data/comments.json',
  });

  @override
  Future<List<Map<String, dynamic>>> fetchComments() async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final decoded = json.decode(jsonStr);

    return (decoded as List)
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }


}

import 'dart:io';
import 'dart:convert';
import 'package:modu_3_dart_study/2025-04-01/data_source/comment_data_source.dart';

// CommentDataSource 구현 클래스
class CommentDataSourceImpl implements CommentDataSource {
  final String filePath;

  CommentDataSourceImpl(this.filePath);

  @override
  Future<List<Map<String, dynamic>>> getAllComments() async {
    final file = File(filePath);
    final String jsonString = await file.readAsString();
    final List<dynamic> data = json.decode(jsonString);
    return List<Map<String, dynamic>>.from(data);
  }
}
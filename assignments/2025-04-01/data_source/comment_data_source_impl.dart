import 'comment_data_source.dart';
import 'dart:io';
import 'dart:convert';

class CommentDataSourceImpl implements CommentDataSource {
  final String filePath;

  CommentDataSourceImpl({required this.filePath});

  @override
  Future<List<Map<String, dynamic>>> fetchComments(int postId) async {
    try {
      final file = File(filePath);

      if (!await file.exists()) {
        throw Exception('File not found: $filePath');
      }

      final String jsonString = await file.readAsString();
      final List<dynamic> decoded = jsonDecode(jsonString);

      final List<Map<String, dynamic>> comments =
          decoded.map((e) => Map<String, dynamic>.from(e)).toList();

      // postId에 해당하는 댓글만 필터링
      return comments.where((comment) => comment['postId'] == postId).toList();
    } catch (e) {
      throw Exception('Failed to load comments: $e');
    }
  }
}
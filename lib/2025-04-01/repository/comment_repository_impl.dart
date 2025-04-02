import 'dart:convert';
import 'dart:io';

import '../model/comment.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  @override
  Future<List<Comment>> getComments(int postId) async {
    try {
      final file = File('lib/2025-04-01/remote/comment.json');
      final jsonString = await file.readAsString();

      final List<dynamic> jsonList = jsonDecode(jsonString);

      final comments =
          jsonList
              .map((json) => Comment.fromJson(json as Map<String, dynamic>))
              .where((comment) => comment.postId == postId)
              .toList();
      return comments;
    } catch (e) {
      print('Error fetching comments: $e');
      return [];
    }
  }
}

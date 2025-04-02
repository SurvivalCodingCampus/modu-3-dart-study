import 'dart:convert';

import 'package:modu_3_dart_study/model/comment.dart';

import '../comment_data_source/comment_data_source.dart';

class MockCommentDataSourceImpl implements CommentDataSource {
  @override
  Future<List<Comment>> getComments() async {
    final jsonData = [
      {
        "albumId": 1,
        "id": 1,
        "title": "Pretender",
        "url": "https://via.placeholder.com/600/92c952",
        "thumbnailUrl": "https://via.placeholder.com/150/92c952",
      },
      {
        "albumId": 1,
        "id": 2,
        "title": "Lost Star",
        "url": "https://via.placeholder.com/600/771796",
        "thumbnailUrl": "https://via.placeholder.com/150/771796",
      },
      {
        "albumId": 1,
        "id": 3,
        "title": "Blue moon",
        "url": "https://via.placeholder.com/600/24f355",
        "thumbnailUrl": "https://via.placeholder.com/150/24f355",
      },
    ];
    return jsonData.map((e) => Comment.fromJson(e)).toList();
  }
}

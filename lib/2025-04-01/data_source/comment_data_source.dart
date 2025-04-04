abstract interface class CommentDataSource {
  Future<List<Map<String, dynamic>>> fetchComments(String path);
}

abstract interface class CommentDataSource {
  Future<List<Map<String, dynamic>>> getComments(int postId);
}

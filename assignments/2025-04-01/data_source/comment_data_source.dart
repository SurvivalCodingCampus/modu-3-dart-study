abstract interface class CommentDataSource {
  Future<List<Map<String,dynamic>>> getAllComments();
  
}
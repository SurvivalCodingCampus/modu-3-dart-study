abstract interface class UserDataSource {
  Future<List<Map<String, dynamic>>> fetchUsers(String path);
}

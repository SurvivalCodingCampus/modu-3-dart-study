abstract interface class AlbumDataSource {
  Future<List<Map<String, dynamic>>> fetchAlbums(String path);
}

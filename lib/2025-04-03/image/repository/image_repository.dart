abstract interface class ImageRepository {
  Future<void> saveIamge(String url, String path);
  Future<void> saveImages(List<String> urls, String directory);
}

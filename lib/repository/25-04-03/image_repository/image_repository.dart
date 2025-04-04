abstract interface class ImageRepository {
  Future<void> saveImage(String url, String path);
  Future<void> saveImages(List<String> urls, String path);
}

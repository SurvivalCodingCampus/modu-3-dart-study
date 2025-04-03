abstract interface class ImageRepository {
  // Url에서 이미지를 다운하여 경로에 저장
  Future<void> saveImage(String url);

  // 여러 Url의 이미지를 지정된 디렉토리에 저장
  Future<void> saveImages(List<String> urls);
}
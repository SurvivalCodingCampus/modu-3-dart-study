enum MediaType {
  article,
  image,
  video,
  unknown;

  // String에서 Enum으로 변환하는 팩토리 생성자
  static MediaType fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'article':
        return MediaType.article;
      case 'image':
        return MediaType.image;
      case 'video':
        return MediaType.video;
      default:
        return MediaType.unknown;
    }
  }
}

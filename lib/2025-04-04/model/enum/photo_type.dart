enum PhotoType {
  article,
  image,
  video,
  unknown,
}

extension PhotoTypeExtension on String? {
  PhotoType toPhotoType() {
    switch (this) {
      case 'article':
        return PhotoType.article;
      case 'image':
        return PhotoType.image;
      case 'video':
        return PhotoType.video;
      default:
        return PhotoType.unknown;
    }
  }
}
enum PhotoType {
  article,
  image,
  video,
  unknown;

  static PhotoType convertPhotoType(String? type){
    switch(type){
      case 'article':
        return PhotoType.article;
      case 'image':
        return PhotoType.image;
      case 'video':
        return PhotoType.video;
      default :
        return PhotoType.unknown;
    }
  }
}
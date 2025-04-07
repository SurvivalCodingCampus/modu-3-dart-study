enum PhotoTypeEnum { article, image, video, unknown }

eunmSwitch(String? type) {
  switch (type) {
    case 'article':
      return PhotoTypeEnum.article;
    case 'image':
      return PhotoTypeEnum.image;
    case 'video':
      return PhotoTypeEnum.video;
    case null:
      return PhotoTypeEnum.unknown;
    case '':
      return PhotoTypeEnum.unknown;
  }
}

class PhotoDto {
  final num? total;
  final num? totalHits;
  final List<Hit>? hits;

  PhotoDto({this.total, this.totalHits, this.hits});

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      total: json['total'],
      totalHits: json['totalHits'],
      hits:
          (json['hits'] as List<dynamic>?)
              ?.map((e) => Hit.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'total': total,
    'totalHits': totalHits,
    'hits': hits?.map((e) => e.toJson()).toList(),
  };
}

class Hit {
  final num? id;
  final String? pageURL;
  final String? type;
  final String? tags;
  final String? previewURL;
  final num? previewWidth;
  final num? previewHeight;
  final String? webformatURL;
  final num? webformatWidth;
  final num? webformatHeight;
  final String? largeImageURL;
  final String? fullHDURL;
  final String? imageURL;
  final num? imageWidth;
  final num? imageHeight;
  final num? imageSize;
  final num? views;
  final num? downloads;
  final num? likes;
  final num? comments;
  final num? userId;
  final String? user;
  final String? userImageURL;

  Hit({
    this.id,
    this.pageURL,
    this.type,
    this.tags,
    this.previewURL,
    this.previewWidth,
    this.previewHeight,
    this.webformatURL,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageURL,
    this.fullHDURL,
    this.imageURL,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageURL,
  });

  factory Hit.fromJson(Map<String, dynamic> json) {
    return Hit(
      id: json['id'],
      pageURL: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      previewURL: json['previewURL'],
      previewWidth: json['previewWidth'],
      previewHeight: json['previewHeight'],
      webformatURL: json['webformatURL'],
      webformatWidth: json['webformatWidth'],
      webformatHeight: json['webformatHeight'],
      largeImageURL: json['largeImageURL'],
      fullHDURL: json['fullHDURL'],
      imageURL: json['imageURL'],
      imageWidth: json['imageWidth'],
      imageHeight: json['imageHeight'],
      imageSize: json['imageSize'],
      views: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      userId: json['user_id'],
      user: json['user'],
      userImageURL: json['userImageURL'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'pageURL': pageURL,
    'type': type,
    'tags': tags,
    'previewURL': previewURL,
    'previewWidth': previewWidth,
    'previewHeight': previewHeight,
    'webformatURL': webformatURL,
    'webformatWidth': webformatWidth,
    'webformatHeight': webformatHeight,
    'largeImageURL': largeImageURL,
    'fullHDURL': fullHDURL,
    'imageURL': imageURL,
    'imageWidth': imageWidth,
    'imageHeight': imageHeight,
    'imageSize': imageSize,
    'views': views,
    'downloads': downloads,
    'likes': likes,
    'comments': comments,
    'user_id': userId,
    'user': user,
    'userImageURL': userImageURL,
  };
}

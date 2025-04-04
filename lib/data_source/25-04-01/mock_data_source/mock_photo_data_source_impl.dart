import '../../../model/25-04-01/photo.dart';
import '../photo_data_source/photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Photo>> getPhotos() async {
    final jsonData = [
      {
        "postId": 1,
        "id": 1,
        "name": "하나",
        "email": "Eliseo@gardner.biz",
        "body": "집에 가고싶다.",
      },
      {
        "postId": 1,
        "id": 2,
        "name": "둘",
        "email": "Jayne_Kuhic@sydney.com",
        "body": " 격렬하게 집에 가고싶다.",
      },
      {
        "postId": 1,
        "id": 3,
        "name": "셋",
        "email": "Nikita@garfield.biz",
        "body": "집에 있어도 집에 가고싶다.",
      },
    ];
    return jsonData.map((e) => Photo.fromJson(e)).toList();
  }
}

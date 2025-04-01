import '../photo_datasource.dart';

class MockPhotoDatasourceImpl implements PhotoDatasource {
  final List<Map<String, dynamic>> _mockData = [
    {
      "albumId": 1,
      "id": 1,
      "title": "고양이 사진 모음",
      "url": "https://funnycats.com/600/1",
      "thumbnailUrl": "https://funnycats.com/150/1",
    },
    {
      "albumId": 1,
      "id": 2,
      "title": "고양이 사료 먹방",
      "url": "https://funnycats.com/600/2",
      "thumbnailUrl": "https://funnycats.com/150/2",
    },
    {
      "albumId": 1,
      "id": 3,
      "title": "고양이 낮잠 스페셜",
      "url": "https://funnycats.com/600/3",
      "thumbnailUrl": "https://funnycats.com/150/3",
    },
    {
      "albumId": 2,
      "id": 4,
      "title": "강아지 첫 산책",
      "url": "https://puppyzone.com/600/1",
      "thumbnailUrl": "https://puppyzone.com/150/1",
    },
    {
      "albumId": 2,
      "id": 5,
      "title": "강아지 목욕 대소동",
      "url": "https://puppyzone.com/600/2",
      "thumbnailUrl": "https://puppyzone.com/150/2",
    },
    {
      "albumId": 2,
      "id": 6,
      "title": "강아지와의 첫 캠핑",
      "url": "https://puppyzone.com/600/3",
      "thumbnailUrl": "https://puppyzone.com/150/3",
    },
    {
      "albumId": 3,
      "id": 7,
      "title": "햄스터 탈출 사건",
      "url": "https://hammyworld.com/600/1",
      "thumbnailUrl": "https://hammyworld.com/150/1",
    },
    {
      "albumId": 3,
      "id": 8,
      "title": "햄스터 숨바꼭질",
      "url": "https://hammyworld.com/600/2",
      "thumbnailUrl": "https://hammyworld.com/150/2",
    },
    {
      "albumId": 3,
      "id": 9,
      "title": "햄스터 런닝머신 도전기",
      "url": "https://hammyworld.com/600/3",
      "thumbnailUrl": "https://hammyworld.com/150/3",
    },
  ];

  @override
  Future<List<Map<String, dynamic>>> fetchPhotos() async {
    return Future.value(_mockData);
  }
}

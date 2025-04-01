// 가짜 데이터 소스 (테스트용)
import 'data_source.dart';

class MockPhotoDataSourceImple implements DataSource {
  @override
  Future<List<dynamic>> getList(filePath) async {
    await Future.delayed(Duration(seconds: 1)); // 네트워크 요청처럼 딜레이 추가
    return [
      {
        "albumId": 1,
        "id": 1,
        "title": "accusamus beatae ad facilis cum similique qui sunt",
        "url": "https://via.placeholder.com/600/92c952",
        "thumbnailUrl": "https://via.placeholder.com/150/92c952",
      },
      {
        "albumId": 1,
        "id": 2,
        "title": "reprehenderit est deserunt velit ipsam",
        "url": "https://via.placeholder.com/600/771796",
        "thumbnailUrl": "https://via.placeholder.com/150/771796",
      },
    ];
  }
}

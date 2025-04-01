import '../album_datasource.dart';

class MockAlbumDatasourceImpl implements AlbumDatasource {
  final List<Map<String, dynamic>> _mockData = List.generate(
    20,
    (i) => {
      "userId": (i % 5) + 1,
      "id": i + 1,
      "title":
          [
            "퇴근길 감성 앨범",
            "출근길 분노 앨범",
            "야근용 집중 앨범",
            "자바스크립트 위로곡",
            "C언어 PTSD 극복용",
            "혼자 사는 사람의 앨범",
            "회의실 몰래 듣기",
            "스터디카페 필수 BGM",
            "404 Not Found 감성",
            "구글 검색창 BGM",
          ][i % 10],
    },
  );

  @override
  Future<List<Map<String, dynamic>>> fetchAlbums() async {
    return Future.value(_mockData);
  }
}

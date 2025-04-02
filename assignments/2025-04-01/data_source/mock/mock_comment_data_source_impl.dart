// 가짜 데이터 소스 (테스트용)
import 'data_source.dart';

class MockCommentDataSourceImpl implements DataSource {
  @override
  Future<List<dynamic>> getList(filePath) async {
    await Future.delayed(Duration(seconds: 1)); // 네트워크 요청처럼 딜레이 추가
    return [
      {
        "postId": 1,
        "id": 1,
        "name": "id labore ex et quam laborum",
        "email": "Eliseo@gardner.biz",
        "body":
            "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium",
      },
      {
        "postId": 1,
        "id": 2,
        "name": "quo vero reiciendis velit similique earum",
        "email": "Jayne_Kuhic@sydney.com",
        "body":
            "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et",
      },
    ];
  }
}

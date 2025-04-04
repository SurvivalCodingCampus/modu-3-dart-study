import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-02/mock/mock_http_client.dart';

class MockHttpClientImpl implements MockHttpClient {
  @override
  MockClient creatMovieMockClient(String url) {
    return MockClient((request) async {
      if (request.url.toString() == url) {
        return http.Response.bytes(
          utf8.encode(
            jsonEncode({
              "results": [
                {
                  "id": 1197306,
                  "title": "A Working Man",
                  "overview": "전직 블랙 옵스 요원이었던 레본 케이드(제이슨 스타뎀)는 평범한 건설 노동자로 살아가며 딸과 함께 조용한 삶을 추구하고 있었으나 그의 상사의 딸이 인신매매 조직에 의해 납치되면서, 다시 과거의 전투 기술을 사용해 그녀를 구하기 위해 나서게 된다. 이 과정에서 시카고의 범죄 조직과 러시아 마피아와 얽히며, 부패와 폭력으로 가득 찬 어두운 세계를 마주하게 되는데...",
                  "releaseDate": "2025-03-26",
                },
              ],
            }),
          ),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });
  }


  @override
  MockClient createTodoMockClient(String url) {
    // TODO: implement createTodoMockClient
    throw UnimplementedError();
  }
}

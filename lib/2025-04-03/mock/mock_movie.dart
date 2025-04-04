import 'dart:convert';
import 'package:http/http.dart' as http;

class MockMovie extends http.BaseClient {
  final Map<Uri, http.Response> mockResponses = {};

  // Mock 응답 추가
  void addMockResponse(Uri url, http.Response response) {
    mockResponses[url] = response;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (mockResponses.containsKey(request.url)) {
      final mockResponse = mockResponses[request.url]!;

      return http.StreamedResponse(
        Stream.fromIterable([utf8.encode(mockResponse.body)]), // ✅ 수정된 부분
        mockResponse.statusCode,
        headers: mockResponse.headers,
      );
    }

    throw Exception("No mock response found for ${request.url}");
  }
}

void main() async {
  final mockClient = MockMovie();

  final testUrl = Uri.parse("https://api.example.com/movies");

  // Mock 응답 추가
  mockClient.addMockResponse(
    testUrl,
    http.Response(
      jsonEncode({
        "results": [
          {"id": 1, "title": "Mock Movie", "overview": "Test overview", "release_date": "2025-01-01"}
        ]
      }),
      200,
      headers: {"Content-Type": "application/json; charset=utf-8"},
    ),
  );

  // 테스트 요청 실행
  final response = await mockClient.get(testUrl);
  print("Status Code: ${response.statusCode}");
  print("Body: ${response.body}");
}
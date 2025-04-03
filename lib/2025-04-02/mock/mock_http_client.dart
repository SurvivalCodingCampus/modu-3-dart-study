import 'package:http/testing.dart';

abstract interface class MockHttpClient {
  MockClient creatMovieMockClient(String url);
  MockClient createTodoMockClient(String url);
}
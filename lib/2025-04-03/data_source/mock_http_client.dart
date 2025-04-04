import 'package:http/testing.dart';

abstract interface class MockHttpClient {
  MockClient createMovieMockClient(String url);
  MockClient createTodoMockClient(String url);
}
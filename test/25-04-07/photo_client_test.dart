import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/data_source/25-04-07/photo_data_source_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() async {
  test('정상적 이미지 요청', () async {
    final mockClient = MockClient((request) async {
      if (request.url.toString().contains('q=dog')) {
        return http.Response(
          jsonEncode([
            {"tags": "dog", "largeImageURL": "https://pixabay.com/dog.jpg"},
          ]),
          200,
        );
      }
      return http.Response("error", 500);
    });
    final dataSource = PhotoDataSourceImpl(client: mockClient);
    final result = await dataSource.getImages('dog');
    expect(result[0].tags, 'dog');
    expect(result[0].largeImageURL, 'https://pixabay.com/dog.jpg');
    //포기
  });
}

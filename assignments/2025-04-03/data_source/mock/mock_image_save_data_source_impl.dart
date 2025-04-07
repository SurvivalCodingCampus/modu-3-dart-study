import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../../model/todo.dart';
import '../image_data_source.dart';
import '../todo_data_source.dart';

class MockImageSaveDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) {
    // TODO: implement fetchImage
    throw UnimplementedError();
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) {
    // TODO: implement saveImage
    throw UnimplementedError();
  }
}
//  Future<Uint8List> fetchImage(String url) async {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return response.bodyBytes;
//     } else {
//       throw Exception("이미지 불러오기 실패 $url");
//     }
//   }

//   @override
//   Future<void> saveImage(Uint8List bytes, String path) async {
//     final file = File(path);
//     await file.writeAsBytes(bytes);
//   }
  // @override
  // Future<Map<String, dynamic>> getTodo(int id) async {
  //   final client = MockClient((request) async {
  //     if (request.url.toString() == _url) {
  //       final todo = {"userId": 1, "id": 1, "title": "쭈꾸미샤브", "body": "먹고싶다."};

  //       return http.Response(
  //         jsonEncode(todo),
  //         200,
  //         headers: {
  //           // HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  //           "content-type": "application/json; charset=utf-8",
  //         },
  //       );
  //     }
  //     return http.Response('Not Found', 404);
  //   });

  //   final response = await client.get(Uri.parse(_url));
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception('투두 로드 실패');
  //   }

  // }


// }

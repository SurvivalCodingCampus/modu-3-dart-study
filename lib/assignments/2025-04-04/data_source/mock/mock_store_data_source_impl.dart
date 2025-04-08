import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:intl/intl.dart';

import '../../dto/store_dto.dart';
import '../../model/store_remain_stat.dart';
import '../store_data_source.dart';
import 'store_file_util.dart';

class MockStoreDataSourceImpl implements StoreDataSource {
  final http.Client _client;
  MockStoreDataSourceImpl(this._client);

  final String _url =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
  final StoreFileUtil _fileUtil = StoreFileUtil(); // JSON 파일 읽어오기

  @override
  Future<List<StoreDto>> getStoresMaskInfo() async {
    final client = MockClient((request) async {
      if (request.url.toString() == _url) {
        return http.Response(
          jsonEncode(await _fileUtil.readJsonData()),
          200,
          headers: {"content-type": "application/json; charset=utf-8"},
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => StoreDto.fromJson(e)).toList();
    } else {
      throw HttpException('Failed to load data');
    }
  }

  @override
  Future<StoreDto> getStoreMaskInfo({required int code}) async {
    final client = MockClient((request) async {
      final url = request.url.toString();

      if (url.startsWith('$_url/')) {
        final codeStr = url.split('/').last;
        Map<String, dynamic>? store;

        final stores = await _fileUtil.readJsonData();
        for (var element in stores) {
          if (element['code'] == codeStr) {
            store = element;
            break;
          }
        }
        if (store != null) {
          return http.Response(
            jsonEncode(store),
            200,
            headers: {"content-type": "application/json; charset=utf-8"},
          );
        } else {
          return http.Response(
            jsonEncode({'message': 'Not Found'}),
            404,
            headers: {"content-type": "application/json; charset=utf-8"},
          );
        }
      }

      return http.Response('Internal Server Error', 500);
    });

    final response = await client.get(Uri.parse('$_url/$code'));

    switch (response.statusCode) {
      case 200:
        final json = jsonDecode(response.body);
        return StoreDto.fromJson(json);
      case 404:
        final message = jsonDecode(response.body)['message'];
        throw HttpException('404 Not Found: $message');
      case 500:
        throw HttpException('500 Internal Server Error');
      default:
        throw HttpException('Unexpected error: ${response.statusCode}');
    }
  }

  @override
  Future<int> postStoreInfo({
    required String addr,
    required String name,
    required double lat,
    required double lng,
  }) async {
    final client = MockClient((request) async {
      final url = request.url.toString();

      if (request.method == 'POST' && url == _url) {
        final body = jsonDecode(request.body);
        final addr = body['addr'];
        final name = body['name'];
        final lat = body['lat'];
        final lng = body['lng'];

        if (addr == null ||
            addr.toString().trim().isEmpty ||
            name == null ||
            name.toString().trim().isEmpty ||
            lat == null ||
            lng == null) {
          return http.Response(
            '누락된 데이터가 있습니다.',
            400,
            headers: {"content-type": "text/plain; charset=utf-8"},
          );
        }

        final stores = await _fileUtil.readJsonData();
        int newCode;

        if (stores.isNotEmpty) {
          final lastStore = stores.last;
          final lastCode = int.tryParse(lastStore['code'] ?? '0') ?? 0;
          newCode = lastCode + 1;
        } else {
          newCode = 1;
        }

        final storeDto = StoreDto(
          code: newCode.toString(),
          addr: addr,
          name: name,
          lat: lat,
          lng: lng,
          remainStat: null,
          stockAt: null,
          createdAt: DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now()),
          type: '01',
        );

        stores.add(storeDto.toJson());

        await _fileUtil.writeJsonFile(stores);

        return http.Response(
          jsonEncode({'code': newCode}),
          200,
          headers: {"content-type": "application/json; charset=utf-8"},
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.post(
      Uri.parse(_url),
      body: jsonEncode({'addr': addr, 'name': name, 'lat': lat, 'lng': lng}),
      headers: {"content-type": "application/json"},
    );
    switch (response.statusCode) {
      case 200:
        final responseData = jsonDecode(response.body);
        return responseData['code'];
      case 404:
        final message = jsonDecode(response.body)['message'];
        throw HttpException('404 Not Found: $message');
      case 400:
        throw HttpException('400 Bad Request');
      default:
        throw HttpException('Unexpected error: ${response.statusCode}');
    }
  }

  @override
  Future<void> patchStoreMaskInfo({
    required int code,
    required StoreRemainStat remainStat,
    required String stockAt,
  }) async {
    final client = MockClient((request) async {
      final url = request.url.toString();

      if (request.method == 'PATCH' && url == _url) {
        final body = jsonDecode(request.body);
        final int? requestCode = body['code'];
        final String? remainStatStr = body['remainStat'];
        final String? stockAtStr = body['stockAt'];

        if (requestCode == null ||
            remainStatStr == null ||
            stockAtStr == null) {
          return http.Response('Bad Request: 필드 누락', 400);
        }

        final StoreRemainStat remainStat = StoreRemainStat.values.firstWhere(
          (e) => e.name == remainStatStr,
          orElse: () => throw Exception('유효하지 않은 remainStat 값'),
        );

        final stores = await _fileUtil.readJsonData();
        final index = stores.indexWhere(
          (store) => int.tryParse(store['code'].toString()) == requestCode,
        );

        if (index == -1) {
          return http.Response(
            'Not Found: 해당 코드 없음',
            404,
            headers: {"content-type": "application/json"},
          );
        }

        stores[index]['stock_at'] = DateFormat(
          'yyyy/MM/dd HH:mm:ss',
        ).format(DateFormat('yyyy/MM/dd HH:mm:ss').parse(stockAtStr));

        stores[index]['remain_stat'] = remainStat.toString().split('.').last;

        await _fileUtil.writeJsonFile(stores);
        return http.Response(
          '수정 완료',
          200,
          headers: {"content-type": "application/json; charset=utf-8"},
        );
      }

      return http.Response('Not Found', 404);
    });

    final response = await client.patch(
      Uri.parse(_url),
      headers: {"content-type": "application/json; charset=utf-8"},
      body: jsonEncode({
        'code': code,
        'remainStat': remainStat.name, // 이 부분도 확인!
        'stockAt': stockAt,
      }),
    );

    switch (response.statusCode) {
      case 200:
        print('✅ 약국 정보 업데이트 성공');
        break;
      case 400:
        throw Exception('400 Bad Request: 요청 데이터 오류');
      case 404:
        throw Exception('404 Not Found: 약국을 찾을 수 없음');
      default:
        throw Exception('Unexpected Error: ${response.statusCode}');
    }
  }

  @override
  Future<void> deleteStore(int code) async {
    final client = MockClient((request) async {
      final url = request.url.toString();

      if (request.method == 'DELETE' && url == _url) {
        final stores = await _fileUtil.readJsonData();
        final body = jsonDecode(request.body);
        final int? requestCode = body['code'];

        if (requestCode == null) {
          return http.Response('Bad Request: 필드 누락', 400);
        }

        final index = stores.indexWhere(
          (store) => int.tryParse(store['code'].toString()) == code,
        );

        if (index == -1) {
          return http.Response(
            'Not Found: 해당 코드 없음',
            404,
            headers: {"content-type": "application/json; charset=utf-8"},
          );
        }

        stores.removeAt(index); // 삭제

        await _fileUtil.writeJsonFile(stores);
        return http.Response(
          '삭제 완료',
          200,
          headers: {"content-type": "application/json; charset=utf-8"},
        ); // 한글 주의 (아래 참고)
      }

      return http.Response('Not Found', 404);
    });

    final response = await client.delete(
      Uri.parse(_url),
      body: jsonEncode({'code': code}),
      // headers: {
      //   HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      // },
      headers: {"content-type": "application/json; charset=utf-8"},
    );

    switch (response.statusCode) {
      case 200:
        print('✅ 약국 삭제 성공');
        break;
      case 404:
        throw Exception('404 Not Found: 약국을 찾을 수 없음');
      default:
        throw Exception('Unexpected Error: ${response.statusCode}');
    }
  }
}

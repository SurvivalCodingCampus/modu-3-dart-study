import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/dto/store_dto.dart';

class StoreRemoteDataSourceImpl implements StoreDataSource {
  final String _url;
  final http.Client _client;
  final Duration _timeout;

  StoreRemoteDataSourceImpl({
    required String url,
    required http.Client client,
    Duration timeout = const Duration(seconds: 10),
  }) : _url = url,
       _client = client,
       _timeout = timeout;

  @override
  Future<List<StoreDto>> getDtoStores() async {
    try {
      final response = await _client
          .get(Uri.parse(_url))
          .timeout(
            _timeout,
            onTimeout: () {
              throw TimeoutException('요청 시간이 초과되었습니다');
            },
          );
      if (response.statusCode == 200) {
        final List jsonList = jsonDecode(utf8.decode(response.bodyBytes));
        final storeDtoList =
            jsonList
                .map((e) => e as Map<String, dynamic>)
                .map((e) => StoreDto.fromJson(e))
                .toList();
        return storeDtoList;
      }
      throw Exception(
        'Failed to fetch stores: HTTP status ${response.statusCode}',
      );
    } catch (e) {
      throw Exception('Failed to fetch stores: $e');
    }
  }
}

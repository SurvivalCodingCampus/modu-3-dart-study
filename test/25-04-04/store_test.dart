import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/data_source/25-04-04/store_data_source.dart';
import 'package:modu_3_dart_study/data_source/25-04-04/store_data_source_impl.dart';
import 'package:modu_3_dart_study/repository/25-04-04/store_repository.dart';
import 'package:modu_3_dart_study/repository/25-04-04/store_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() async {
  final mockClient = MockClient((request) async {
    if (request.url.toString() ==
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json') {
      return http.Response(
        jsonEncode([
          {
            "name": "hopeful pharmacy",
            "addr": "i don't know how to write address",
            "remain_stat": "plenty",
            "stock_at": "2025-04-04",
            "created_at": "2025-04-04",
          },
        ]),
        200,
      );
    }
    return http.Response("error", 500);
  });
  final StoreDataSource dataSource = StoreDataSourceImpl(client: mockClient);
  final StoreRepository repository = StoreRepositoryImpl(dataSource);

  test('storeList', () async {
    final store = await repository.getStoreList();
    print(store);
    expect(store.length, 1);
    expect(store[0].name, 'hopeful pharmacy');
  });
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/remote/store_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/store_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/repository/store_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/repository/store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('Store 테스트', () {
    StoreDataSource storeDataSource = StoreDataSourceImpl();
    StoreRepository storeRepository = StoreRepositoryImpl(
      dataSource: storeDataSource,
    );

    test('유효하지 않은 데이터 없앴는지 테스트', () async {
      final dataSourceResult = await storeDataSource.getDtoStores();
      final repositoryResult = await storeRepository.getStores();
      expect(dataSourceResult.length, 222);
      expect(repositoryResult.length, 216);
    });

    test('MockClient 테스트', () async {
      final mockClient = MockClient((request) async {
        final jsonString =
            await File(
              'lib/assignments/2025-04-04/store/data/mask.json',
            ).readAsString();
        final Map jsonMap = jsonDecode(jsonString);
        return Response.bytes(utf8.encode(jsonEncode(jsonMap["stores"])), 200);
      });
      StoreDataSource mockStoreDataSource = StoreRemoteDataSourceImpl(
        url: 'naver.com',
        client: mockClient,
      );
      StoreRepository mockStoreRepository = StoreRepositoryImpl(
        dataSource: mockStoreDataSource,
      );
      final mockRepositoryResult = await mockStoreRepository.getStores();
      expect(mockRepositoryResult.length, 216);
    });
  });
}

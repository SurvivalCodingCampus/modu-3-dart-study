import 'package:modu_3_dart_study/2025-04-04/data_source/mask_store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/data_source/mask_store_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/model/store.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/mask_store_repository.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/mask_store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('MaskStoreRepositoryImpl', () {
    const String validUrl =
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
    const String invalidUrl = 'https://invalid.example.com/maskstores';
    late MaskStoreRepository repository;
    late MaskStoreDataSource dataSource;

    setUpAll(() {
      dataSource = MaskStoreDataSourceImpl(url: validUrl);
      repository = MaskStoreRepositoryImpl(dataSource: dataSource);
    });

    test('getValidStores는 API 호출이 성공하면 유효한 상점 목록을 반환합니다', () async {
      final stores = await repository.getValidStores();

      expect(stores, isA<List<Store>>());

      for (var store in stores) {
        print(store.toString());
        expect(store.name, isNotNull);
        expect(store.addr, isNotNull);
        expect(store.lat, isNotNull);
        expect(store.lng, isNotNull);
        expect(store.remainStat, isNotNull);
      }
    });

    test('getValidStores는 404 오류 시 예외를 발생시킵니다', () async {
      dataSource = MaskStoreDataSourceImpl(url: invalidUrl);
      repository = MaskStoreRepositoryImpl(dataSource: dataSource);

      expect(() async => await repository.getValidStores(), throwsException);
    });

    test('getValidStores는 500 오류 시 예외를 발생시킵니다', () async {
      dataSource = MaskStoreDataSourceImpl(url: invalidUrl);
      repository = MaskStoreRepositoryImpl(dataSource: dataSource);

      expect(() async => await repository.getValidStores(), throwsException);
    });
  });
}

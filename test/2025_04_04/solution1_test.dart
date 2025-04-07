import 'package:test/test.dart';

import '../../assignments/2025_04_04/solution1/mock/mock_mask_store_data_source_impl.dart';
import '../../assignments/2025_04_04/solution1/data_source/mask_store_data_source.dart';

import '../../assignments/2025_04_04/solution1/data_source/mask_store_data_source_impl.dart';
import '../../assignments/2025_04_04/solution1/repository/mask_store_repository.dart';
import '../../assignments/2025_04_04/solution1/repository/mask_store_repository_impl.dart';

void main() {
  group('1번 문제', () {
    final mockMaskStoreDataSourceImpl = MockMaskStoreDataSourceImpl();
    final MaskStoreRepository maskStoreRepository = MaskStoreRepositoryImpl(
      maskStoreDataSource: mockMaskStoreDataSourceImpl,
    );

    test('DateSource 에서 DTO 로 데이터 반환 확인', () async {
      final result = await mockMaskStoreDataSourceImpl.getStoresDto();
      // print(result)

      expect(result[0].addr, '서울특별시 강북구 솔매로 38 (미아동)');
    });
    test('Repository 에서 Model 로 데이터 반환 확인', () async {
      final results = await maskStoreRepository.getStoresModel();
      final result = await maskStoreRepository.getStoreModel(11817488);

      print(results);
      // expect(results[2].name, matcher);
    });
    test('', () async {});
    test('', () async {});
    test('', () async {});
  });
}

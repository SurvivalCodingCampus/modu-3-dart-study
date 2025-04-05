import 'package:modu_3_dart_study/PR2025-04-04/mask/data_source/mock/mock_store_data.dart';
import 'package:modu_3_dart_study/PR2025-04-04/mask/repository/store_repository.dart';
import 'package:modu_3_dart_study/PR2025-04-04/mask/repository/store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  MockStoreData mockStoreData = MockStoreData();
  StoreRepository repository = StoreRepositoryImpl(
    storeDataSource: mockStoreData,
  );
  //mockdata를 json파일로 디코드해서 해보기
  //repository 기능체크
  group('Mask 확인 Test', () {
    test('MockData의 첫번째 객체 확인 test', () async {
      final String firstAddr = '서울특별시 강북구 솔매로 38 (미아동)';
      final String firstCreatedAt = '2020/07/03 11:00:00';
      final double firstLat = 37.6254369;
      final double firstLng = 127.0164096;
      final String firstName = '승약국';
      final store = await repository.getStoreInfoList();

      expect(store.first.storeName, firstName);
      expect(store.first.addres, firstAddr);
      expect(store.first.lat, firstLat);
      expect(store.first.lng, firstLng);
      expect(store.first.openDay, firstCreatedAt);
    });
    test('MockData에 createdAt에 Null값 존재할때 해당 객체를 제외하는지 확인 test', () async {
      final store = await repository.getStoreInfoList();
      //MockData에 4개 중 createdAt에 null이 들어가 있는 객체 제외 한 갯수 3이 출력됨
      expect(store.length, 3);
    });
  });
}

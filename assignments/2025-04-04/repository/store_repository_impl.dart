import 'package:http/http.dart' as http;

import '../data_source/mock/mock_store_data_source_impl.dart';
import '../data_source/store_data_source.dart';
import '../dto/store_dto.dart';
import '../mepper/store_mepper.dart';
import '../model/store.dart';
import '../model/store_remain_stat.dart';
import 'store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSorece;
  StoreRepositoryImpl(this._dataSorece);

  /* 약국별 마스크 목록 가져오기 */
  @override
  Future<List<Store>> getStores() async {
    final stores = await _dataSorece.getStoresMaskInfo();
    print('⭐️ 약국별 마스크 목록 가져오기 ⭐️');
    return stores.map((e) => e.toStore()).toList();
  }

  /* 특정약국의 마스크정보 불러오기 */
  @override
  Future<Store> getStore(int code) async {
    final StoreDto store = await _dataSorece.getStoreMaskInfo(code: code);
    print('⭐️ 특정약국의 마스크정보 불러오기 ⭐️');
    return store.toStore();
  }

  /* 약국 정보 등록하기 */
  @override
  Future<Store> createStore({
    required String addr,
    required String name,
    required double lat,
    required double lng,
  }) async {
    final int code = await _dataSorece.postStoreInfo(
      addr: addr,
      name: name,
      lat: lat,
      lng: lng,
    );
    final StoreDto newStore = await _dataSorece.getStoreMaskInfo(code: code);
    print('⭐️ 약국 정보 등록하기 ⭐️');
    return newStore.toStore();
  }

  /* 특정약국의 마스크 정보 업데이트하기 */
  @override
  Future<Store> updateMaskStat({
    required int code,
    required StoreRemainStat remainStat,
    required String stockAt,
  }) async {
    await _dataSorece.patchStoreMaskInfo(
      code: code,
      remainStat: remainStat,
      stockAt: stockAt,
    );
    final StoreDto updateStore = await _dataSorece.getStoreMaskInfo(code: code);
    print('⭐️ 특정약국의 마스크 정보 업데이트하기 ⭐️');
    return updateStore.toStore();
  }

  /* 특정약국 정보 지우기 */
  @override
  Future<void> deleteStore(int code) async {
    print('⭐️ 특정약국 정보 지우기 ⭐️');
    await _dataSorece.deleteStore(code);
  }
}

void main() async {
  final httpClient = http.Client();
  final dataSource = MockStoreDataSourceImpl(httpClient);

  final repository = StoreRepositoryImpl(dataSource);

  // /* 약국별 마스크 목록보기 */
  final stores = await repository.getStores();
  for (Store store in stores) {
    printStore(store);
  }
  print('\n\n');
  /* 특정 약국 정보 보기 */
  final store = await repository.getStore(4);
  printStore(store);
  print('\n\n');

  /* 약국 추가하기 */
  final newstore = await repository.createStore(
    addr: '서울시',
    name: '지롱이 약국',
    lat: 37.6261612,
    lng: 127.0180494,
  );
  printStore(newstore);
  print('\n\n');

  /* 약국 마스크 정보 업데이트하기 */
  final updateStore = await repository.updateMaskStat(
    code: 6,
    remainStat: StoreRemainStat.some,
    stockAt: '2025/04/05 22:00:30',
  );
  printStore(updateStore);
  /* 약국 삭제하기 */
  await repository.deleteStore(7);
}

void printStore(Store store) {
  print('🏪 상호명   : ${store.name}');
  print('📍 주소     : ${store.addr}');
  print('😷 재고 상태: ${store.remainStat?.label ?? '정보 없음'}');
  print('📦 입고 시간: ${store.stockAt}');
  print('🕰️ 등록일   : ${store.createdAt}');
  print('----------------------------------');
}

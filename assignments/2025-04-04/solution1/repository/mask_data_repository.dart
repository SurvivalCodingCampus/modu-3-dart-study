import '../dto/mask_info_dto.dart';
import '../model/store.dart';

abstract interface class MaskDataRepository {
  //모든 마스크 판매처 리스트를 MaskInfoDtoStores로 가져오기
  Future<List<MaskInfoDtoStores>> getAllMaskStore();

  //List<MaskInfoDtoStores>를 Store 리스트로 변환
  Future<List<Store>> converterStoreList();

  //Store 조건에 맞는 스토어를 반환
  Future<Store> getOneStore({required String code});
}

import 'package:modu_3_dart_study/2025-04-04/solution1/data_source/mask_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/solution1/data_source/mask_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/solution1/dto/mask_info_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/solution1/mapper/mask_mapper.dart';
import 'package:modu_3_dart_study/2025-04-04/solution1/model/store.dart';
import 'package:modu_3_dart_study/2025-04-04/solution1/repository/mask_data_repository.dart';

class MaskDataRepositoryImpl implements MaskDataRepository {
  MaskDataSource _maskDataSource = MaskDataSourceImpl();

  @override
  Future<List<MaskInfoDtoStores>> getAllMaskStore() async {
    final allData = await _maskDataSource.fetchData();
    List<MaskInfoDtoStores> allMaskStoreList = [];
    for (Map<String, dynamic> storeList in allData["stores"]) {
      allMaskStoreList.add(MaskInfoDtoStores.fromJson(storeList));
    }

    return allMaskStoreList;
  }

  @override
  Future<List<Store>> converterStoreList() async {
    final List<MaskInfoDtoStores> maskStoreList = await getAllMaskStore();
    if (maskStoreList.isEmpty) return [];
    List<Store> storeList = [];
    for (MaskInfoDtoStores maskStore in maskStoreList) {
      if (maskStore.remainStat.toString() != 'null' &&
          maskStore.stockAt.toString() != 'null' &&
          maskStore.createdAt.toString() != 'null' &&
          maskStore.remainStat.toString() != '' &&
          maskStore.stockAt.toString() != '' &&
          maskStore.createdAt.toString() != '') {
        storeList.add(maskStore.toStore());
      }
    }

    return storeList;
  }

  @override
  Future<Store> getOneStore({required String code}) async {
    final List<Store> storeList = await converterStoreList();
    return storeList.where((e) => e.code == code).toList().first;
  }
}

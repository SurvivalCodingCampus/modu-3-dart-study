import '../dto/store_list_dto.dart';
import '../model/store_list.dart';
import 'store_mapper.dart';

extension StoreListMapper on StoreListDto {
  StoreList toStoreList() {
    return StoreList(stores: stores.map((e) => e.toStore()).toList());
  }
}

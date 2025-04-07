import 'package:modu_3_dart_study/2025-04-04/dto/store_list_dto.dart';

abstract interface class StoreDataSource {
  Future<StoreListDto> fetchStoreList();
}
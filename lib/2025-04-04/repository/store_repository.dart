import 'package:modu_3_dart_study/2025-04-04/model/store_list.dart';

abstract interface class StoreRepository {
  Future<StoreList> getStoreList();
}
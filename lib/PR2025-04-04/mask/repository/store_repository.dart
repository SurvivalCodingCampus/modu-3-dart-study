import 'package:modu_3_dart_study/PR2025-04-04/mask/model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStoreInfoList();
}

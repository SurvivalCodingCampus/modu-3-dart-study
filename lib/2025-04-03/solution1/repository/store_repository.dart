import 'package:modu_3_dart_study/2025-04-03/solution1/model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getAllStores();
}
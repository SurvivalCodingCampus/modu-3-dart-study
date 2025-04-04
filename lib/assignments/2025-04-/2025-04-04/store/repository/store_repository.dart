import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> fetchStores();
  Future<List<Store>> filteredStores();
}

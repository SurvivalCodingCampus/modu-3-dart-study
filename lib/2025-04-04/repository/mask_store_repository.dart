import 'package:modu_3_dart_study/2025-04-04/model/store.dart';

abstract interface class MaskStoreRepository {
  Future<List<Store>> getValidStores();
}

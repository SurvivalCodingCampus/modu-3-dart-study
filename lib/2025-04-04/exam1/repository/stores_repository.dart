import 'package:modu_3_dart_study/2025-04-04/exam1/model/stores.dart';

abstract interface class StoresRepository {
  Future<List<Stores>> getStoresModel();
}
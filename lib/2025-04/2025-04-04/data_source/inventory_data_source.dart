import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/inventory_dto.dart';

abstract interface class InventoryDataSource {
  Future<List<InventoryDto>> fetchInventories(String url);
}

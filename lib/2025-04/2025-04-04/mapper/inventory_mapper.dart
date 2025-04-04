import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/inventory_dto.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/inventory.dart';

extension InventoryMapper on InventoryDto {
  Inventory toModel() {
    return Inventory(
      addr: addr!,
      code: code!,
      createdAt: createdAt!,
      lat: lat!,
      lng: lng!,
      name: name!,
      stockAt: stockAt!,
      remainStatus: remainStatus!,
      type: type!,
    );
  }
}

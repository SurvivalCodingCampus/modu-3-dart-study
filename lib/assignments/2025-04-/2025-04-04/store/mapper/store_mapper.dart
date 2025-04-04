import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/common/const/error_data.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/dto/store_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore(){
    final stringNullData = ErrorData.stringNullData;
    return Store(
      addr: addr ?? stringNullData,
      code: code ?? stringNullData,
      createdAt: createdAt ?? stringNullData,
      lat: lat == null ? 0 : lat!.toDouble(),
      lng: lng == null ? 0 : lng!.toDouble(),
      name: name ?? stringNullData,
      remainStat: remainStat ?? stringNullData,
      stockAt: stockAt ?? stringNullData,
      type: type ?? stringNullData,
    );
  }
}
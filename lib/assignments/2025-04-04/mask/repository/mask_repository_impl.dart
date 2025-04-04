import 'package:modu_3_dart_study/assignments/2025-04-04/mask/data_source/mask_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/mask/dto/mask_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/mask/mapper/mask_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/mask/model/mask.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/mask/repository/mask_repository.dart';

class MaskRepositoryImpl implements MaskRepository {
  final MaskDataSource _dataSource;

  MaskRepositoryImpl({required MaskDataSource dataSource})
    : _dataSource = dataSource;
  @override
  Future<List<Mask>> getStores() async {
    final List<Map<String, dynamic>> jsonList = await _dataSource.getStores();
    // print('jsonList : $jsonList');
    final storeDtoList = jsonList.map((e) => Store.fromJson(e)).toList();
    // print('storeDtoList : $storeDtoList');
    final storeList = storeDtoList.map((e) => e.toModel()).toList();
    // print('storeList : $storeList');
    return storeList
        .where(
          (element) =>
              element.remainStat != '' &&
              element.stockAt != DateTime(1999, 1, 1) &&
              element.createdAt != DateTime(1999, 1, 1),
        )
        .toList();
  }
}

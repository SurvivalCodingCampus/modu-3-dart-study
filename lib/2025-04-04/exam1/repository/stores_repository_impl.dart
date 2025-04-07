import 'package:modu_3_dart_study/2025-04-04/exam1/data_source/stores_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/exam1/mapper/stores_extension.dart';
import 'package:modu_3_dart_study/2025-04-04/exam1/repository/stores_repository.dart';

import '../model/stores.dart';

class StoresRepositoryImpl implements StoresRepository {
  final StoresDataSource dataSource;

  StoresRepositoryImpl(this.dataSource);

  @override
  Future<List<Stores>> getStoresModel() async {
    try {
      final dtos = await dataSource.fetchStores();
      return dtos
          .where(
            (dto) =>
                dto.remainState != null &&
                dto.remainState!.isNotEmpty &&
                dto.stockAt != null &&
                dto.createdAt != null,
          )
          .map((dto) => dto.stores())
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch stores: $e');
    }
  }
}

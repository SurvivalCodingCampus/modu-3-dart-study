import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/store_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/repository/store_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/repository/store_repository_impl.dart';

void main(List<String> args) async {
  StoreDataSource storeDataSource = StoreDataSourceImpl();
  final dataSourceResult = await storeDataSource.getDtoStores();
  // print(dataSourceResult.length);
  StoreRepository storeRepository = StoreRepositoryImpl(
    dataSource: storeDataSource,
  );
  final result = await storeRepository.getStores();
  print(result);
  print(dataSourceResult.length);
  print(result.length);
}

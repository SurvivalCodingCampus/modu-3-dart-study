import 'data_source/mask_store_data_source_impl.dart';
import 'repository/mask_store_repository.dart';
import 'repository/mask_store_repository_impl.dart';

void main() async {
  final maskStoreDataSourceImpl = MaskStoreDataSourceImpl();
  final MaskStoreRepository maskStoreRepository = MaskStoreRepositoryImpl(
    maskStoreDataSource: maskStoreDataSourceImpl,
  );

  // print(await maskStoreDataSourceImpl.getStoresDto());
  // print(await maskStoreRepository.getStoresModel());
  print(await maskStoreRepository.getStoreModel(11817488));
}

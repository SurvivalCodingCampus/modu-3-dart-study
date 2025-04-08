import 'model/store.dart';
import 'repository/mask_data_repository.dart';
import 'repository/mask_data_repository_impl.dart';

void main() async {
  MaskDataRepository maskDataRepository = MaskDataRepositoryImpl();

  final List<Store> storeList = await maskDataRepository.converterStoreList();

  final Store getOneStore = await maskDataRepository.getOneStore(
    code: '12844551',
  );

  print(getOneStore);
}

import 'package:modu_3_dart_study/2025-04-04/solution1/model/store.dart';
import 'package:modu_3_dart_study/2025-04-04/solution1/repository/mask_data_repository.dart';
import 'package:modu_3_dart_study/2025-04-04/solution1/repository/mask_data_repository_impl.dart';

void main() async {
  MaskDataRepository maskDataRepository = MaskDataRepositoryImpl();

  final List<Store> storeList = await maskDataRepository.converterStoreList();

  final Store getOneStore = await maskDataRepository.getOneStore(
    code: '12844551',
  );

  print(getOneStore);
}

import 'package:modu_3_dart_study/assignments/2025-04-04/mask/data_source/mask_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/mask/data_source/mask_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/mask/repository/mask_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/mask/repository/mask_repository_impl.dart';

void main(List<String> args) async {
  MaskDataSource maskDataSource = MaskDataSourceImpl();
  // final temp = await maskDataSource.getStores();
  // print(temp);
  // print(temp.length);

  // print('test');
  // print(DateTime.parse('1999-01-01'));
  // print("2020/07/02 18:05:00".replaceAll('/', '-'));
  // print(DateTime.parse("2020/07/02 18:05:00".replaceAll('/', '-')));


  MaskRepository maskRepository = MaskRepositoryImpl(
    dataSource: maskDataSource,
  );
  final temp2 = await maskRepository.getStores();
  print(temp2);
  print(temp2.length);
}

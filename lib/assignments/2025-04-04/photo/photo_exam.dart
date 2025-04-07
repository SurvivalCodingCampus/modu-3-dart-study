import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/repository/photo_repository_impl.dart';

void main(List<String> args) async {
  final String path1 = 'lib/assignments/2025-04-04/photo/data/mock_data1.json';
  final String path2 = 'lib/assignments/2025-04-04/photo/data/mock_data2.json';
  PhotoDataSource photoDataSource1 = PhotoDataSourceImpl(path: path1);
  PhotoDataSource photoDataSource2 = PhotoDataSourceImpl(path: path2);
  PhotoRepository photoRepository1 = PhotoRepositoryImpl(
    dataSource: photoDataSource1,
  );
  PhotoRepository photoRepository2 = PhotoRepositoryImpl(
    dataSource: photoDataSource2,
  );

  print(await photoRepository1.getPhotos());
  print(await photoRepository2.getPhotos());
}

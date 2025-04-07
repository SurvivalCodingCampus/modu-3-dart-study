import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/core/photo_result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/data_source/photo_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/repository/photo_repository_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/util/photo_error_enum.dart';

void main(List<String> args) async {
  PhotoDataSource photoDataSource = PhotoRemoteDataSourceImpl(
    client: http.Client(),
  );
  PhotoRepository photoRepository = PhotoRepositoryImpl(
    dataSource: photoDataSource,
  );

  final result = await photoRepository.getPhotos(
    '/?key=49670428-5777fcd74043221f9aba01a1b',
  );

  switch (result) {
    case Success(data: final photoList):
      print(photoList);
      print(photoList.length);
    case Error(error: final error):
      switch (error) {
        case PhotoError.badWord:
          print('badword error');
        case PhotoError.networkError:
          print('network error');
      }
  }
}

import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/common/extension/file_extension.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/image/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/image/repository/image_repository.dart';
import 'package:intl/intl.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _dataSource;
  static const _defaultDir = 'lib/assignments/2025-04-/2025-04-04/image/data/';
  // 파일명은 저장 날짜 및 분초로 설정
  //   => DateTime은 컴파일 시점에서 할당 불가
  final _path =
      _defaultDir + '${DateFormat('yyyy_MM_dd_mm_ss').format(DateTime.now())}';
  ImageRepositoryImpl(this._dataSource);

  @override
  Future<void> saveImage(String url) async {
    final resp = await _dataSource.fetchImage(url);
    // 파일의 확장자 확인 후 해당 확장자로 저장
    final extension = url.getFileExtension();
    final path = _path + '.$extension';
    await _dataSource.saveImage(resp, path);
  }

  @override
  Future<void> saveImages(List<String> urls) async {
    for (final url in urls) {
      final image = await _dataSource.fetchImage(url);
      // 파일의 확장자 확인 후 해당 확장자로 저장
      final extension = url.getFileExtension();
      final path = _path + '.$extension';
      await _dataSource.saveImage(image, path);
    }
  }
}

import 'package:modu_3_dart_study/PR2025-04-04/photo/enum/photo_enum.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/mock/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/repository/photo_repository.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() async {
  final MockPhotoDataSourceImpl mockPhotoDataSourceImpl =
      MockPhotoDataSourceImpl();
  final PhotoRepository photoRepository = PhotoRepositoryImpl(
    photoDataSource: mockPhotoDataSourceImpl,
  );
  final results = await photoRepository.getPhotos();

  test('type이 없을경우 unknown으로 처리', () async {
    expect(results.last.type, PhotoEnum.Unknown);
  });
  test('createdAt이 mapper를 통해 제대로 DateTime형식으로 변환되었는지 확인', () async {
    expect(results[0].createdAt is DateTime, true);
  });
}

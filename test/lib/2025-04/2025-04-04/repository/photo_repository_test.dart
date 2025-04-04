import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/http_photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/photo.dart'
    show Photo;
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/photo_type.dart'
    show PhotoType;
import 'package:modu_3_dart_study/2025-04/2025-04-04/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import '../mock/mock_client.dart';

void main() {
  final PhotoDataSource dataSource = HttpPhotoDataSource(photoMock);
  final PhotoRepository repository = PhotoRepositoryImpl(dataSource);

  test('findAll() 호출 시 DTO를 모델로 변환하여 반환해야한다.', () async {
    expect(await repository.findAll(), isA<List<Photo>>());
  });

  test('type이 없는 잘못된 데이터의 경우 PhotoType.unknown으로 값이 있어야한다.', () async {
    final List<Photo> photos = await repository.findAll();
    final List<Photo> unknowns =
        photos.where((e) => e.type == PhotoType.unknown).toList();

    expect(unknowns, isNotEmpty);
    expect(unknowns.first.type, same(PhotoType.unknown));
  });

  test('Photo 인스턴스의 createdAt은 날짜형식(DateTime)이어야 한다.', () async {
    final Photo? photo = await repository.findOne((e) => e.id == 1);
    expect(photo?.createdAt, isA<DateTime>());
  });
}

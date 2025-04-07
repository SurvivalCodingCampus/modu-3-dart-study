import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/http_photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/photo_dto.dart';
import 'package:test/test.dart';

import '../mock/mock_client.dart';

void main() {
  final PhotoDataSource dataSource = HttpPhotoDataSource(photoMock);

  test('잘못된 값을 받아도 PhotoDTO로 변환할 수 있어야한다.', () async {
    expect(await dataSource.fetch(), isA<List<PhotoDto>>());
  });
}

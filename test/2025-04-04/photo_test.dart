import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-04-04/mock/mock_photo.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/model/photo.dart'; 

void main() {
  test('Mock 데이터를 이용해 PhotoRepository가 올바른 Photo만 리턴하는지 테스트', () async {
    final repository = PhotoRepositoryImpl(dataSource: MockPhoto());

    final result = await repository.getPhotos();

    expect(result.length, 3); // invalid_type 하나는 걸러짐
    expect(result[0].type, PhotoType.article);
    expect(result[1].type, PhotoType.image);
    expect(result[2].type, PhotoType.video);
  });
}
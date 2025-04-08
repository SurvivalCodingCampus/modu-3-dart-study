import '../dto/pixabay_dto.dart';

abstract interface class PhotoDataSource {
  Future<PixabayDto> getPixabayData();
}

import '../data_source/photo_data_source.dart';
import '../dto/photo_dto.dart';
import '../mapper/photo_mapper.dart';
import '../model/photo.dart';

class PhotoRepository {
  final PhotoDataSource photoDataSource;

  const PhotoRepository({required this.photoDataSource});

  Future<List<PhotoDto>> getFetchData() async {
    final List<dynamic> fetchPhoto = await photoDataSource.mockGetPhoto();
    return fetchPhoto.map((e) => PhotoDto.fromJson(e)).toList();
  }

  Future<List<Photo>> getPhoto() async {
    final List<PhotoDto> fetchPhotoList = await getFetchData();
    List<Photo> photoList = [];
    for (PhotoDto photoDto in fetchPhotoList) {
      photoList.add(photoDto.toPhoto());
    }

    return photoList;
  }
}

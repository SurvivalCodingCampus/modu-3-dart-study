import '../../../base/base_data_source_impl.dart';
import '../photo_data_source.dart';

class PhotoDataSourceImpl extends BaseDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getPhotos() async {
    final data = await getList('assignments/structure/2025-04-01/photo/data/photo.json');
    return data;
  }
}
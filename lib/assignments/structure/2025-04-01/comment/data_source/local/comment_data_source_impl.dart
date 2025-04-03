import '../comment_data_source.dart';
import '../../../base/base_data_source_impl.dart';

class CommentDataSourceImpl extends BaseDataSourceImpl implements CommentDataSource {
  @override
  Future<List<Map<String, dynamic>>> getComments() async {
    
    final path = 'assignments/structure/2025-04-01/comment/data/comment.json';
    final data = await getList(path);
    return data;
  }
}

import '../../../utils/json_repository.dart';
import '../../data_source/impl/comment_data_source_impl.dart';
import '../../model/comment.dart';
import '../comment_repository.dart';

class CommentRepositoryImpl
    extends JsonRepository<Comment, int, CommentDataSourceImpl>
    implements CommentRepository {
  CommentRepositoryImpl(super.dataSource, super.entity);
}

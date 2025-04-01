import '../../utils/json_repository.dart';
import '../data_source/impl/comment_data_source_impl.dart';
import '../model/comment.dart';

abstract interface class CommentRepository
    extends JsonRepository<Comment, int, CommentDataSourceImpl> {
  CommentRepository(super.dataSource, super.entity);
}

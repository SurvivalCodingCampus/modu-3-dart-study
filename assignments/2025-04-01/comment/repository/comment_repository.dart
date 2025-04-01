import '../../utils/json_repository.dart';
import '../data_source/comment_data_source.dart';
import '../model/comment.dart';

abstract class CommentRepository
    extends JsonRepository<Comment, int, CommentDataSource> {
  CommentRepository(super.dataSource, super.entity);
}

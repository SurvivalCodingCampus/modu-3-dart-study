import 'package:modu_3_dart_study/2025-04/2025-04-04/model/photo.dart';

typedef FindOneFilter = bool Function(Photo predicate);

abstract interface class PhotoRepository {
  Future<Photo?> findOne(FindOneFilter predicate);
  Future<List<Photo>> findAll();
}

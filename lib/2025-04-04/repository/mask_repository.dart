import '../model/mask.dart';

abstract class MaskRepository {
  Future<List<Mask>> getMasks();
  Future<Mask> getMask(String code);
}
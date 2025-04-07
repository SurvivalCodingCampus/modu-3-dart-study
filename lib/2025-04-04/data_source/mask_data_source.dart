import 'package:modu_3_dart_study/2025-04-04/dto/mask_dto.dart';

abstract class MaskDataSource {
  Future<List<MaskDto>> getMasks();
}
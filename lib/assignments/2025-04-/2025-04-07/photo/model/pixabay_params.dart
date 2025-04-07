import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/costants/key/key.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/converter/tag_converter.dart';

class PixabayParams {
  final String key;
  final String lang;
  final String imageType;
  final List<String> tags;

  const PixabayParams({
    this.key = ApiKeys.pixabayKey,
    this.lang = 'ko',
    this.imageType = 'photo',
    required this.tags,
  });

  String toQuery() {
    return '?key=$key&lang=$lang&image_type=$imageType&tags=${CustomConverter.listToString(tags)}';
  }
}


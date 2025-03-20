import 'package:modu_3_dart_study/2025-03-19/index.dart';

// 무형 자산
abstract class IntangibleAsset extends Asset {
  IntangibleAsset(
    super.name,
    super.createdDate,
    super.manageDepart,
    super.description,
  );
}

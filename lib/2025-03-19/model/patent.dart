import 'package:modu_3_dart_study/2025-03-19/index.dart';
// 특허권
class Patent extends IntangibleAsset {
  Patent(super.name, super.createdDate, super.manageDepart, super.description);

  @override
  int calculateTax() {
    throw UnimplementedError();
  }
}

import '../index.dart';

// 특허권
class Patent extends IntangibleAsset {
  Patent(super.name, super.createdDate, super.manageDepart, super.description);

  @override
  int calculateTax() {
    throw UnimplementedError();
  }
}

import 'intangible_asset.dart';

class Patent extends IntangibleAsset {
  String patentNumber;

  Patent({
    required this.patentNumber,
    required super.name,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
  });

  @override
  int calculateTax() {
    return 100000;
  }
}
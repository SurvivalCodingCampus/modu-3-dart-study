import 'intangible_asset.dart';

class Patent extends IntangibleAsset {
  bool exclusiveRight; //특허권의 독점권
  int patentDurationYears; //유한성 (특허 보허기간(년))

  Patent({
    required super.name,
    required super.price,
    required super.owner,
    required this.exclusiveRight,
    required this.patentDurationYears,
  });
}

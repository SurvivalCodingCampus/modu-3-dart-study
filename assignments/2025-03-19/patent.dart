import 'intangible_asset.dart';

class Patent extends IntangibleAsset {
  String owner;
  Patent({required super.name, required super.price, required this.owner});
}

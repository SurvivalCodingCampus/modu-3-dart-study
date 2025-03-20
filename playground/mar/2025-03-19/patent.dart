import 'intangibleAsset.dart';

class Patent extends IntangibleAsset {
  Patent({
    required super.name,
    required super.price,
    required super.owner,
    required super.registrationNumber,
  });

  @override
  void identify() {
    print('특허 : $name, 가격 : $price원, 소유자 : $owner, 등록번호 : $registrationNumber');
  }
}

import 'package:test/test.dart';

import '../../assignments/2025-03-19/patent.dart';

void main() {
  test("무형자산 patent(특허권) 테스트", (){
    final name = "특허권";
    final price = 10000;
    final patent = Patent(name: name, price: price);
    
    expect(patent, isA<Patent>());
    expect(patent.name, patent.name);
    expect(patent.price, patent.price);
  });
}
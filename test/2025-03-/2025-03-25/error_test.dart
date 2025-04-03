import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  group("error test", () {
    final numString = "10.5";
    int num;
    test("runtime error test", () {
      expect(() => num = int.parse(numString), throwsA(isA<FormatException>()));
    });
    test("try catch test", () {
      try {
        num = int.parse(numString);
      } catch (e) {
        num = 0;
      }
      print("try catch after num: $num");
      expect(num, 0); 
    });
  });
}

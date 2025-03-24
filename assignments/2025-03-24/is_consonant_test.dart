import 'package:test/test.dart';
import 'is_consonant.dart';
import 'strong_box.dart';

void main() {
  test('isConsonant()이 자음을 정확히 판별해야 함', () {
    Word w = Word();
    w.word = 'code';

    expect(w.isConsonant(0), isTrue);  // 'c' → 자음
    expect(w.isConsonant(1), isFalse); // 'o' → 모음 → 자음 아님
    expect(w.isConsonant(2), isTrue);  // 'd' → 자음
    expect(w.isConsonant(3), isFalse); // 'e' → 모음
  });
}

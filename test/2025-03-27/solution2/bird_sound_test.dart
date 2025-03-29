import 'package:modu_3_dart_study/2025-03-27/solution2/bird_sound.dart';
import 'package:test/test.dart';

void main() {
  test('새소리 테스트', () async {
    await bird(sound: "꾸우", second: 1);
    await bird(sound: "까악", second: 2);
    await bird(sound: "짹짹", second: 3);
  });
}

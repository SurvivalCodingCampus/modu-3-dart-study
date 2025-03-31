import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-27/bird_crying_sound.dart';
import '../../../playground/mar/2025-03-27/bird_crying_sound_2.dart';

void main() {
  test('4번씩 울어', () async {
    await birdSoundCount(4);
  });
  test('10초간 울어', () async {
    await birdSoundTime(10);
  });
}

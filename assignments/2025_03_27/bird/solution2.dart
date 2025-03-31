import 'bird.dart';

void main() {
  Bird bird = Bird();

  final pegion = bird.pigeonInfy();
  final crow = bird.crowInfy();
  final sparrow = bird.sparrowInfy();

  bird.stopSound(pegion, crow, sparrow);
}

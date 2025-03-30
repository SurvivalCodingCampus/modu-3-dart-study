import 'bird.dart';

void main() async {
  final bird = Bird();
  List<Future<void>> future = [bird.pigeon(), bird.crow(), bird.sparrow()];

  await future.wait;
}

import 'dart:io';

class Sparrow {
  final String sound = '째액';

  Future<void> cryingSound() async {
    stdout.write('$sound ');
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  String toString() {
    return 'Sparrow{sound: $sound}';
  }
}

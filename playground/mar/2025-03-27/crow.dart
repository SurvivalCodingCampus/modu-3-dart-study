import 'dart:io';

class Crow {
  final String sound = '까악';

  Future<void> cryingSound() async {
    stdout.write('$sound ');
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  String toString() {
    return 'Crow{sound: $sound}';
  }
}

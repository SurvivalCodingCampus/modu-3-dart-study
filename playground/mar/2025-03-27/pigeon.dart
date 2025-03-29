import 'dart:io';

class Pigeon {
  final String sound = '구우';

  Future<void> cryingSound() async {
    stdout.write('$sound ');
    await Future.delayed(Duration(seconds: 3));
    return;
  }

  @override
  String toString() {
    return 'Pigeon{sound: $sound}';
  }
}

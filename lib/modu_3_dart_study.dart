void main() async {
  final bird1 = Bird(sound: '꾸우', seconds: 1);
  final bird2 = Bird(sound: '까악', seconds: 2);
  final bird3 = Bird(sound: '짹짹', seconds: 4);
  
  for(int i=0; i<4; i++){
    bird1.sing();
    bird2.sing();
    bird3.sing();
  }
}

class Bird {
  final String sound;
  final int seconds;
  Bird({required this.sound, required this.seconds});

  Future<void> sing2() async {
    await Future.delayed(Duration(seconds: seconds));
      print(sound);
  }

  Future<void> sing() async {
    await Future.delayed(Duration(seconds: 1));
    print(sound);
  }
}

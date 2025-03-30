class Bird {
  bool isSound = true;
  int soundCount = 10;

  Future<void> pigeon() async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 1));
      print('꾸우');
    }
  }

  Future<void> crow() async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 2));
      print('까악');
    }
  }

  Future<void> sparrow() async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 3));
      print('짹짹');
    }
  }
}

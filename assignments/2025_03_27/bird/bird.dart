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

  Future<void> pigeonInfy() async {
    while (isSound) {
      await Future.delayed(Duration(seconds: 1));
      if (!isSound) return;
      print('꾸우');
    }
  }

  Future<void> crowInfy() async {
    while (isSound) {
      await Future.delayed(Duration(seconds: 2));
      if (!isSound) return;
      print('까악');
    }
  }

  Future<void> sparrowInfy() async {
    while (isSound) {
      await Future.delayed(Duration(seconds: 3));
      if (!isSound) return;
      print('짹짹');
    }
  }

  Future<void> stopSound(
    Future<void> function1,
    Future<void> function2,
    Future<void> function3,
  ) async {
    try {
      await Future.delayed(Duration(seconds: soundCount));
      isSound = false;
      return;
    } finally {
      print('프로그램 종료');
    }
  }
}

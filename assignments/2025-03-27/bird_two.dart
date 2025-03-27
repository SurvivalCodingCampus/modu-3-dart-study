Future<void> oneSecondBirdDuring(bool Function() isRunning) async {
  while (isRunning()) {
    await Future.delayed(Duration(seconds: 1), () => print('꾸우'));
  }
}

Future<void> twoSecondBirdDuring(bool Function() isRunning) async {
  while (isRunning()) {
    await Future.delayed(Duration(seconds: 2), () => print('까악'));
  }
}

Future<void> threeSecondBirdDuring(bool Function() isRunning) async {
  while (isRunning()) {
    await Future.delayed(Duration(seconds: 3), () => print('짹짹'));
  }
}

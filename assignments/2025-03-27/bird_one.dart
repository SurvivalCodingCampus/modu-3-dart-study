Future<void> oneSecondBird() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 1), () => print('꾸우'));
  }
}

Future<void> twoSecondBird() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 2), () => print('까악'));
  }
}

Future<void> threeSecondBird() async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: 3), () => print('짹짹'));
  }
}

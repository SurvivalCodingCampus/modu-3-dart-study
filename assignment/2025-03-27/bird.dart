abstract class Bird {
  int get delay;
  String get tweetSound;

  Future<dynamic> _clearanceDuration() async {
    await Future.delayed(Duration(seconds: delay));
  }

  Future<void> tweet(int count) async {
    for (int i = 0; i < count; i++) {
      print(tweetSound);
      await _clearanceDuration();
    }
  }
}

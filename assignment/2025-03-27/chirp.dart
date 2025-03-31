import 'index.dart';

class Chirp extends Bird {
  @override
  int get delay => 3;

  @override
  String get tweetSound => '🦜짹짹~';
}

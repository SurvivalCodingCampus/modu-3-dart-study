import 'index.dart';

class Grassland {
  final List<Bird> birds;

  Grassland({required this.birds});

  Future<void> tweetTogether({required int count}) async {
    final List<Future<void>> futures = [];

    for (final bird in birds) {
      final tweet = bird.tweet(count);
      futures.add(tweet);
    }

    await Future.wait(futures);
  }
}

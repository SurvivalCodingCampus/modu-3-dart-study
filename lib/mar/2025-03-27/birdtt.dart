abstract class Bird {
  Future<void> tweet();
}

class Coo extends Bird {
  @override
  Future<void> tweet() async {
    print('꾸우~');
    await Future.delayed(Duration(seconds: 1));
  }
}

class Caw extends Bird {
  @override
  Future<void> tweet() async {
    print('까악~');
    await Future.delayed(Duration(seconds: 2));
  }
}

class Chirp extends Bird {
  @override
  Future<void> tweet() async {
    print('짹짹~');
    await Future.delayed(Duration(seconds: 3));
  }
}

class Grassland {
  final List<Bird> birds;

  const Grassland({required this.birds});

  Future<void> tweetFourth() async {
    final futures =
        birds.map((bird) async {
          for (int i = 0; i < 4; i++) {
            await bird.tweet();
          }
        }).toList();

    // print(futures.length);

    await Future.wait(futures);
  }
}

main() async {
  final s = Stopwatch()..start();
  final g = Grassland(birds: [Coo(), Caw(), Chirp()]);
  await g.tweetFourth();
  print('${s.elapsed.inSeconds}초');
}

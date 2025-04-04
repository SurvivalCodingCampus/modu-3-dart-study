extension SlashConverter on String {
  String get changeSlash {
    return trim().replaceAll('/', '-');
  }
}

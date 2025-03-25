

class Word {
  String word = '';
  List<String> vowelList = ['a', 'e', 'i', 'o', 'u'];

  bool isVowel(int i) {
    if (RegExp(r'^[a-zA-Z]$').hasMatch(word.substring(i, i + 1))) {
      return vowelList.contains(word.substring(i, i + 1).toLowerCase());
    } else {
      return false;
    }
  }

  bool isConsonant(int i) {
    if (RegExp(r'^[a-zA-Z]$').hasMatch(word.substring(i, i + 1))) {
      return !vowelList.contains(word.substring(i, i + 1).toLowerCase());
    } else {
      return false;
    }
  }
}

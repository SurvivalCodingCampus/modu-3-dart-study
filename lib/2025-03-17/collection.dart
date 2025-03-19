void main() {
  Map<String, int> ageMap = {
    '홍길동': 20,
    '한석봉': 25
  };
  for (final e in ageMap.entries) {
    print('${e.key}의 나이는 ${e.value}살');
  }
}
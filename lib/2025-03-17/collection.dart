void main() {
  Map<String, int> ageMap = {
    '홍길동': 20,
    '한석봉': 25
  };
  for (final ageMap in ageMap.entries) {
    print('${ageMap.key}의 나이는 ${ageMap.value}살');
  };
}
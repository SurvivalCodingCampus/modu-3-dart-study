void main() {
  Map<String, int> peopleAges = {
    '홍길동': 20,
    '한석봉': 25,
  };

  peopleAges.forEach((name, age) {
    print('$name의 나이는 $age살');
  });
}
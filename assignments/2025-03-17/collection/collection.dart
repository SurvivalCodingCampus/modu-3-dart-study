void main() {

  //키와 값으로 구성된 데이타로 Map 컬렉션 적합
  Map<String, int> people = {
    '홍길동': 20,
    '한석봉': 25,
  };

  //개별 항목을 출력
  people.entries.forEach((element) {
    print('${element.key}의 나이는 ${element.value}살.');
  });


}
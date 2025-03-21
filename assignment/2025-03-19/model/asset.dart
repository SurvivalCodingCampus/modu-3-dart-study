// 자산
abstract class Asset {
  // 자산 이름
  final String name;

  // 만들어진 날짜
  final DateTime createdDate;

  // 관리 부서
  final String manageDepart;

  // 설명
  final String description;

  Asset(this.name, this.createdDate, this.manageDepart, this.description);

  // 세금 계산
  int calculateTax();

  // 자산 거래. 거래 대상 등은 미구현
  void transact() {
    print('🤝자산을 팔았습니다');
  }
}

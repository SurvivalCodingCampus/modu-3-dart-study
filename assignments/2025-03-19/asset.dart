abstract class Asset {
  final String _name;
  final String _createdDate;
  final String _manageDepart; // 관리부서
  final String _description; // 설명

  Asset({
    required String name,
    required String createdDate,
    required String manageDepart,
    required String description,
  }) : _name = name,
        _createdDate = createdDate,
        _manageDepart = manageDepart,
        _description = description;

  String get name => _name;

  String get createdDate => _createdDate;

  String get manageDepart => _manageDepart;

  String get description => _description;

  // 모든 자산이 가져야 할 기능
  int calculateTax(); // 세금 계산

  void transact(); // 거래

  void dispose(); // 폐기
}
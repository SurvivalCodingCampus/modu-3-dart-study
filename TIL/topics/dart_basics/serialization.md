## 직렬화 ( 클래스 -> Json)

toJson으로 출력을 바꿔줌 Map<String, dynamic> 국룰 dynamic말고 object를 쓸 수도 있지만 어려움

toJson() = 객체 데이터( Map<String, dynamic> 형태)를 다룰때
jsonEncode() = Json 문자열이 필요할때( 파일저장, api 요청 등), 파일에는 map형태로 저장할 수 없음, 그래서 String형태로 바꾸어주는
jsonEncode가 필요

```dart
class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

//직렬화
  Map<String, dynamic> toJson() {
    return {'department_name': name, 'leader': leader};
  }

//역직렬화
  Department.fromJson(Map<String, dynamic> json)
      : name = json['department_name'],
        leader = Employee.fromJson(json['leader']);
}

void main() {
  final employee = Employee('홍길동', 41);
  final department = Department('총무부', employee);
//json형식으로 바꿔서 출력할 수 있도록 해줌
  final jsonString = jsonEncode(department.toJson());
  final companyFile = File('company.txt');
  companyFile.writeAsStringSync(jsonString);
}

```

- Map을 사용한 Department클래스에서는 toJson으로 직렬화 해줌
- fromJson으로 역정렬화 해주기
- leader는 map형태니까 추가로 역정렬화
- 파일에 저장할 내용들이 담긴 department 인자를 toJson 해줌
- jsonEncode를 사용해 파일에 저장할 수 있는 형식으로 바꿈

## List 형식에 역직렬화 방법

```dart
class ChartData {
  final String collectionName;

  //원본에 collectionSalePrice이곳은 List 형식으로 저장되어있어 List형식으로 선언
  final List<SalePrice> collectionSalePrice;

  ChartData(this.collectionName, this.collectionSalePrice);

  ChartData.fromJson(Map<String, dynamic> json)
      : collectionName = json["collectionName"],
  //값을 리스트 형태로 역직렬화, 중요한 구조
        collectionSalePrice =
        (json["collectionSalePrice"] as List)
            .map((item) => SalePrice.fromJson(item))
            .toList();
}
```
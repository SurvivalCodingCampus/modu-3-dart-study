class Employee {
  final String name;
  final int age;

  Employee(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  //역직렬화 만들어두기
  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}

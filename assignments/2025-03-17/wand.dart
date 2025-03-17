class Wand {
  String name; // 이름
  double power; // 마력

  Wand({
    required this.name,
    required this.power,
  });

  set setName(String value){
    if(value.length < 3){
      throw Exception("지팡이의 이름은 3글자 이상이여야합니다.");
    }
    name = value;
  }

  set setPower(double value){
    if(value < 0.5 || value > 100){
      throw Exception("지팡이의 마력은 0.5와 100사이여야합니다.");
    }
  }
}
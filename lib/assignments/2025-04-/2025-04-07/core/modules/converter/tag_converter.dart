abstract class CustomConverter {

  // String을 List<String>으로 자동 변환
  static List<String> stringToList(String json) => json.split(',');

  // List<String>을 String으로 자동 변환
  static String listToString(List<String> object) => object.join(',');
}


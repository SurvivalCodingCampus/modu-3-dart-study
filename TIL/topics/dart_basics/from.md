from 을 사용하면 형변환이 쉽게 됨
List<String>.from(리스트<다이나믹>)

final List<dynamic> results = jsonData['results'];
//List<dynamic>으로 변환한 데이터는 함수에서 ist<Map<String, dynamic>> 이 타입으로 받으니 from 을 사용해 형변환해서 출력
return List<Map<String, dynamic>>.from(results);
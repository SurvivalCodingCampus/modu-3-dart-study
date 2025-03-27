void main() {
  //myFunction();
  try {
    final numString = '10.5';
    int num = int.parse(numString);
    print(num);
  } catch (e) {
    throw e;
  }
}

void myFunction() {
  throw MyException('내가 만든 익셉션');
}

class MyException implements Exception {
  final String message;

  MyException(this.message);

  @override
  String toString() {
    return 'MyException{message: $message}';
  }
}

// void main(){
//   int zero =0;
//   try {
//     final numString = '10.5';
//     int num = int.parse(numString);
//     print(num);
//   } catch (e) {
//     print(zero);
//   }
// }

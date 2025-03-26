void main() {
  try {
    final numString = '10.5';
    int num = int.parse(numString);
  } catch (e) {
    print('예외 발생: $e');
    int num = 0; 
    print('num의 값은 이제 $num입니다.');
  }
}
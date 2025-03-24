import 'package:test/test.dart';

import '../../assignments/2025-03-24/key_type.dart';
import '../../assignments/2025-03-24/strong_box.dart';

void main() {
  final intInitialValue = 1;
  final intAfterValue = 2;
  final stringInitialValue = '1번';
  final stringAfterValue = '2번';
  final doubleInitialValue = 1.1;
  final doubleAfterValue = 2.2;
  final listIntInitialValue = [1,2];
  final listIntAfterValue = [1,2,3];
  final strongBox1 = StrongBox<int>(intInitialValue, keyType: KeyType.padlock);
  final strongBox2 = StrongBox<String>(stringInitialValue, keyType: KeyType.button);
  final strongBox3 = StrongBox<double>(doubleInitialValue, keyType: KeyType.dial);
  final strongBox4 = StrongBox<List<int>>(listIntInitialValue, keyType: KeyType.finger);
  group("금고 test", (){
    test("count 값 테스트", (){
      expect(strongBox1.count, StrongBox.padlockCount);
      expect(strongBox2.count, StrongBox.buttonCount);
      expect(strongBox3.count, StrongBox.dialCount);
      expect(strongBox4.count, StrongBox.fingerCount);
    });

    test("int type get/put & padlock 함수 테스트", (){
      for(int i=0; i<StrongBox.padlockCount - 1; i++){
        strongBox1.get;
      }
      expect(strongBox1.get, null);
      expect(strongBox1.get, intInitialValue);

      strongBox1.put = intAfterValue;

      expect(strongBox1.get, intAfterValue);
    });

    test("int type get/put & button 함수 테스트", (){
      for(int i=0; i<StrongBox.buttonCount - 1; i++){
        strongBox2.get;
      }

      expect(strongBox2.get, null);
      expect(strongBox2.get, stringInitialValue);

      strongBox2.put = stringAfterValue;

      expect(strongBox2.get, stringAfterValue);
    });

    test("double type get/put & dial 함수 테스트", (){
      for(int i=0; i<StrongBox.dialCount - 1; i++){
        strongBox3.get;
      }
      
      expect(strongBox3.get, null);
      expect(strongBox3.get, doubleInitialValue);

      strongBox3.put = doubleAfterValue;

      expect(strongBox3.get, doubleAfterValue);
    });

    test("List<int> type get/put & finger 함수 테스트", (){
      for(int i=0; i<StrongBox.fingerCount - 1; i++){
        strongBox4.get;
      }

      expect(strongBox4.get, null);
      expect(strongBox4.get, listIntInitialValue);

      strongBox4.put = listIntAfterValue;

      expect(strongBox4.get, listIntAfterValue);
    });
  });
}
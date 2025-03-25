import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-24/keyType.dart';
import '../../assignments/2025-03-24/strongBox.dart';

void main() {

  final int data = 45;
  final KeyType keyType = KeyType.padlock;

  group("strongBox", (){

      test("strongBox - put메서드", (){
        StrongBox<int> box = StrongBox<int>(keyType: keyType);

        box.put(data);

        expect(box, isA<StrongBox<int>>());
        expect(box.data, equals(data));
        expect(box.get(), equals(null));
      });

      test("strongBox - get() 시도횟수 미만", (){
        StrongBox<int> box = StrongBox<int>(keyType: keyType);

        box.get();

        expect(box.get(), equals(null));
        expect(box.count, equals(2));
      });

      test("strongBox - get() 시도횟수 초과", (){
        StrongBox<int> box = StrongBox<int>(keyType: keyType);

        box.put(data);
        for(int i=0; i<keyType.maxCount; i++){
            box.get();
        }

        expect(box.get(), equals(data));
      });
  });
}
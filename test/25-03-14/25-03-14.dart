
import "../../assignments/2025-03-14/cleric.dart";
void main( ) {
 final cleric1 = Cleric('성기사');
     print ('${cleric1.name} , hp : ${cleric1.hp} , mp : ${cleric1.mp}');

 final cleric2 = Cleric('성기사',  hp : 50 , mp : 50);
    print ('${cleric2.name} , hp : ${cleric2.hp} , mp : ${cleric2.mp}');
}

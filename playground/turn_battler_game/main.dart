import 'class/beginner.dart';
import 'character.dart';
import 'enemy.dart';
import 'statistics.dart';
import 'turn_decider.dart';

void main() {
  Character user1 = Beginner(name: 'Jehwan', statistics: Statistics.random());
  Character user2 = Enemy(name: 'Taeho', statistics: Statistics.random());

  TurnDecider turnDecider = TurnDecider(characters: [user1, user2]);

  while (true) {
    Character c = turnDecider.next();
    Character enemy = turnDecider.peek;
    c.attack(enemy);

    if (enemy.hp <= 0) {
      print('[System] ${enemy.name}의 체력이 0이므로 전투를 종료합니다.');
      print('[System] 🎉 ${c.name}의 승리입니다. 🎉');
      break;
    }

    print('[System] 다음은 ${turnDecider.peek.name} 차례입니다.');
  }
}

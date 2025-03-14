import 'package:modu_3_dart_study/25-03-13/slime.dart';

import 'hero.dart';

Hero hero = Hero('용사',100);

Slime slime1 = Slime('A', 50);
Slime slime2 = Slime('B', 48);

hero.attack();
slime1.run();
hero.attack();
slime2.run();
hero.run();
hero.sleep();
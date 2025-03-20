# 과제 설명

## 그룹 설계 과제

- 바텀 업 (Marine, Medic. Tank, Vulture, Scv) 으로 설계함.
- 많은 인터페이스가 존재하여 인터페이스를 Implements하는 인터페이스를 추가하여 정리하였다.

<br>

- Zerg, Protoss는 AutoRecoverable(회복 HP, 방어막)이 가능하고 Protoss의 Shield 하나뿐임.
  - 필드가 필요한 것은 Unit, Structure 부터이므로 추상클래스로 선언.
    - 여러개의 Unit, Structure를 만드는 대신 Terran, Zerg, Protoss가 각각 Unit, Structure를 상속하게 함.
  - int hp, int cost, int? shield
  - Structure는 공격이 불가능하므로 damage 필드 없음.
  - damage는 메딕은 사용하지 않으므로 nullable, 주석 추가
  - shield는 프로토스만 사용하므로 nullable, 주석 추가

<br>

- Bionic, Mechanic은 인터페이스로 함.
  - Zerg의 경우 건물이 Bionic이고, 프로토스는 Dragun이 Mechanic임.
  - Bionic은 IsHealabe(회복)이 가능함.
  - Terran의 Mechanic은 수리가 가능하므로 IsRepairableMechanic으로, Protoss는 수리가 불가능하므로 Mechanic으로 선언.

<br>

- **Scv**은 Repairable(수리), IsRepairable(수리 가능), IsHealable(치료 가능),  Harvestable(채취) 특성을 가진다.
  - Harvestable(채취)와 Repairable(수리)는 Scv만이 가짐.
  - IsRepairable은 테란 Mechanic이면 모두 가지는 특성이여서 IsRepairableMechanic을 Implements하면서 구현된다.
  - 예외적으로 치료 가능한 Mechanic이므로 IsHealable을 Implements한다.

<br>

- 기능 정리 인터페이스
  - Attackable(공격), Healable(치료), Movable(이동), Harvestable(채취), Repairable(수리), AutoRecoverable(회복)
- 기능 적용 대상 확인용 인터페이스
  - IsHealable(치료 가능), IsRepairable(수리 가능)

<br>

### 그룹화

<br>

- TerranUnit, ZergUnit, ProtossUnit은 모두 Movable을 implements하고 있기 때문에 움직일 수 있는 것만 그룹화 가능하다.
- ZergUnit, ProtossUnit은 모두 Attackable하면 TerranUnit은 Medic이 공격이 불가하기 때문에 Medic을 제외한 나머지가 Attackable을 implements한다.
- 따라서 그룹화 후 이동, 공격이 가능하다.
# 과제 설명

## 그룹 설계 과제

- 바텀 업 (Marine, Medic. Tank, Vulture, Scv) 으로 설계함.

<br>

- Terran, Zerg, Protoss 각각 Unit, Structure을 모두 가지고 있고, 종족 특성이 있는 것은 Protoss의 Shield 하나뿐임.
    - 굳이 Unit과 Structure을 개별로 따로따로 만드는 것보다 int? shield로 선택할 수 있게 함.

- Unit, Structure는 필드가 필요해서 추상클래스 선언.
    - int hp, int cost, int? damage, int? shield
    - damage는 메딕은 사용하지 않으므로 nullable, 주석 추가
    - shield는 프로토스만 사용하므로 nullable, 주석 추가

<br>

- Bionic, Mechanic은 인터페이스로 함.
    - Zerg의 경우 건물이 Bionic이고, 프로토스는 Dragun이 Mechanic임.
    - Bionic, Mechanic만의 특징이 없어 그룹화를 위해 인터페이스 사용

<br>

- 기능 정리 인터페이스
    - Attackable(공격), Healable(치료), Movable(이동), Harvestable(채취), Repairable(수리), AutoRecoverable(회복)
- 기능 적용 대상 확인용 인터페이스
    - IsHealable(치료 가능), IsRepairable(수리 가능)

<br>

- 모든 유닛이 추상 클래스 Unit을 상속받고 있기 때문에 List<Unit>으로 서로 다른 유닛을 담을 수 있다.
    - Unit은 인터페이스 Movable을 implements하고 있기 때문에 모두 이동 가능하다.
    - Unit중 공격이 불가능한 Medic만 Attackable을 implements하고 있지 않다. Attackable 가능한 유닛만 공격하게 할 수 있다.
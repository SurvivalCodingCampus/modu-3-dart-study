# Git 정리

<br>

## Git 이란?

협업, 코드 관리를 위한 형상 관리 도구

<br>

## 주요 개념

- branch : 독립적으로 어떤 작업을 진행하기 위한 개념. master 가 기본 브랜치.
- repository : 파일이나 데이터 버전을 관리하고 저장하는 저장소.
- fork : 남의 저장소를 복사해서 내 것으로 만드는 것.
    - 원하는 레포지토리에서 Fork 버튼 누르면 됨.
- merge : 병합. 작업 내용 합치기
- HEAD : 현재 작업 중인 위치
- 브랜치 충돌 : 동일한 파일의 같은 부분이 서로 다르게 수정되었을 때 발생.

충돌이 발생해도, 병합 자체는 진행 중이기 때문에 파일 수정 후 add, commit 하고 나면 다시 merge 입력할 필요 없음.

<br>

## Git 명령어

- `git init`  : 기본 브랜치 생성
    - Git 중첩되는 경우가 있을 수 있으니 init 시 디렉토리 확인 필수. 나중에 잘못했을 때 .git을 지우면서 해결 가능.
- `git clone [ git주소(https:) ]`  :  원격저장소에서 로컬로 복제
- `git status`  : 현재 Git 저장소의 **상태를 확인**. 추적되지 않는 파일을 확인
- **`git add`** : 파일을 추적 가능하도록 **인덱스**에 등록. 파일 생성하면서 add 가능.
    - `git add .`  : 모든 파일 등록
    - `git add [파일경로]`  : 특정 파일 추적 가능하도록 등록
- **`git commit`** : 변경 사항을 **로컬 저장소에 영구 저장**
    - `git commit -m "sample.txt 파일을 작성"`  : 커밋 명령어. 변경사항 기록 가능
    - **커밋 후에도 원격 저장소(GitHub)에는 반영되지 않음**
- **`git push`** : GitHub에 적용
- `git log`  : GitHub관련 기록 확인. 이거 아니어도 alt+9로 시각적으로 확인 가능
- `git branch [ 이름 ]`  : 브랜치 만들기
- `git branch`  : 현재 브랜치 확인
- `git checkout`  : 다른 브랜치로 전환
- `git merge`  \[브랜치 이름\] : master 등 주가 되는 브랜치로 이동 후 실행.
    - `git branch` 로 \* 위치 잘 확인할것
    - `git branch -d [지울 브랜치]`  로 병합 후 남은 브랜치는 삭제할것. (기능 완성 후 삭제)
- `git reset`  : 이전 시점으로 돌아가기
    -  —hard HEAD~ : 한단계 이전 커밋으로 되돌리기. (--hard HEAD~1랑 같은 의미)
- `git fetch`  : 리모트의 정보만 가져오고 파일은 받지 않음. 리모트 확인만 하고 싶을 때 사용
- `git pull`  : 리모트의 파일을 받아와서 리모트와 로컬을 맞추는과정

<br>

<br>

## Git branch 구조 참고

<br>

###  🔗 [https://backlog.com/ja/git-tutorial/stepup/05/](https://backlog.com/ja/git-tutorial/stepup/05/)

<br>

![](http://localhost:9425/images/4f03b574-f83a-44e0-80ab-294cddd739d3.png)<br>

<br>

- **master** branch : 제품의 최종 안정적인 버전을 관리하는 브랜치. 태그를 달면 버전별로 찾아가기 좋음
- **develop** branch : **feature** 브랜치에서 개발이 완료되면 **develop** 브랜치에 병합
- **feature** branch : 큰 기능이 있는 경우 기능별로 만드는 브랜치
- **release** branch : 배포 준비를 위한 브랜치
- **hotfix** branch : 빠른 문제 수정을 위한 브랜치

<br>
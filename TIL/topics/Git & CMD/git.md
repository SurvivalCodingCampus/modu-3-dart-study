### fork 된 거를 내 컴퓨터에 내려 받는 법

1. cmd창 실행
2. 원하는 파일로 이동한 후
3. git clone https://~~~
4. dir 명령어를 활용해 파일 확인해보기

Branch  = 평행 우주의 개념으로 생각하면 좋음
```
C:\Users\gomti\DartCamp\modu-3-dart-study>git branch
```
결과 : * master

git status - 현재 추적되지 않은 파일을 확인합니다

git add . - 모든 파일을 추적 대상으로 추가하기

git commit -m "sample.txt 파일을 작성하였습니다"

git push - 원격 저장소에 변경사항 반영하기

git log - 커밋 기록 확인하기 (종료: q 키)

순서
1. git add .
2. git commit -m “메세지”
3. git push
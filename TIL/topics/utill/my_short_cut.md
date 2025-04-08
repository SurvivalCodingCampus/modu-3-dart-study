# Android Studio Short cut 정복



## Android Studio

# Android Studio 단축키 정리



## 파일 및 프로젝트 탐색

| 기능                                    | 단축키 (Mac)        |
| --------------------------------------- | ------------------- |
| Project 창 열기/파일 디렉토리 영역 이동 | `Cmd + 1`           |
| Project 창에서 코드 파일 열기           | `Enter`             |
| Project 창 숨기기/보이기                | `Cmd + Shift + F12` |
| 최근 사용 파일 목록 보기                | `Cmd + E`           |
| 현재 파일 위치 보기                     | `Command + F1`      |
| 폴더 모두 펼치기                        | `Command + Right`   |
| 변경된 파일 확인 (Version Control 창)   | `Cmd + 9`           |
| Run 콘솔 토글                           | `Cmd + 4`           |
| 전체 파일에서 찾기                      | Cmd + shift + f     |
| 현재 파일 내 바꾸기                     | Cmd + R             |



## 코드 편집 기본

| 기능                       | 단축키 (Mac)               |
| -------------------------- | -------------------------- |
| 줄 번호로 바로 이동        | `Cmd + L`                  |
| 인덴트 자동 정렬           | `Option + Cmd + L`         |
| 디렉토리 내 전체 자동정렬  | `dart format .`            |
| 해당 줄 그대로 복사        | `Cmd + D`                  |
| 코드 펼치기, 접기          | `Cmd + .`                  |
| 폰트 사이즈 조절           | `Control + Shift + , or .` |
| 앞에 문자 무시하고 개행    | `Shift + Enter`            |
| import 도움/Context Action | `Option + Enter`           |



## 커서 및 선택

| 기능                   | 단축키 (Mac)                    |
| ---------------------- | ------------------------------- |
| 중괄호/블록 전체 선택  | `Option + 방향키`, `Option + ↑` |
| 첫 커서로 이동         | `Fn + Cmd + Shift + ←`          |
| 다중 커서 추가         | `Shift + Option + 클릭`         |
| 여러줄 caret 추가      | `Option 두번 후 방향키`         |
| 블록 끝줄에 caret 추가 | `Option + Shift + G`            |
| 블록 시작에 caret 추가 | `Cmd + Shift + 8`               |
| 동일 코드 다음 선택    | `Control + G`                   |



## 코드 분석 및 생성

| 기능                  | 단축키 (Mac)               |
| --------------------- | -------------------------- |
| 코드 생성(제너레이터) | `Cmd + N`                  |
| Structure 확인        | `Cmd + 7` 또는 `Cmd + F12` |
| 상속 계층 보기        | `Control + H`              |
| Parameter 정보 보기   | `Command + P`              |



## 디버깅

| 기능                   | 단축키 (Mac)       |
| ---------------------- | ------------------ |
| Debug Mode Run         | `Option + D`       |
| Debug Resume           | `Option + Cmd + R` |
| Step Into (들어가기)   | `F7`               |
| Step Over (한 칸 이동) | `F8`               |
| Step Out (나오기)      | `Shift + F8`       |
| 실행 중지              | `Command + F2`     |
| Evaluate Expression    | `Option + F8`      |



## Git 관련

| 기능                    | 단축키 (Mac)                       |
| ----------------------- | ---------------------------------- |
| 변경 사항 커밋          | `Cmd + K`                          |
| Push                    | `Cmd + Shift + K`                  |
| Pull                    | `Cmd + T`                          |
| 파일 히스토리 보기      | `Cmd + Shift + C`                  |
| 변경 사항 취소 (Revert) | `Cmd + Alt + Z`                    |
| Git 브랜치/Merge/Rebase | `Cmd + Shift + A` → 해당 기능 검색 |



## 에뮬레이터 제어

| 기능                    | 단축키 (Mac)           |
| ----------------------- | ---------------------- |
| 에뮬레이터 창 크기 확대 | `Cmd + ↑`              |
| 에뮬레이터 창 크기 축소 | `Cmd + ↓`              |
| 원래 크기로 복귀        | `Cmd + 0`              |
| 창 크기 수동 조절       | 마우스로 모서리 드래그 |



## Mac

| 기능 설명               | 단축키           |
| ----------------------- | ---------------- |
| 폴더 경로 입력하기      | shift + cmd + g  |
| 스플릿 뷰 다시 되돌리기 | fn + control + r |





### 기본 Shell 명령어



#### 파일 및 디렉터리 관련

| **명령어** | **설명**                               | **예제**                    |
| ---------- | -------------------------------------- | --------------------------- |
| pwd        | 현재 작업 중인 디렉터리 출력           | pwd                         |
| ls         | 현재 디렉터리의 파일 및 폴더 목록 표시 | ls -l (자세한 정보 포함)    |
| cd         | 디렉터리 이동                          | cd ~/Documents              |
| mkdir      | 새 디렉터리(폴더) 생성                 | mkdir myfolder              |
| rmdir      | 빈 디렉터리 삭제                       | rmdir myfolder              |
| rm         | 파일 또는 폴더 삭제                    | rm file.txt, rm -r myfolder |
| cp         | 파일/폴더 복사                         | cp file1.txt file2.txt      |
| mv         | 파일/폴더 이동 또는 이름 변경          | mv oldname.txt newname.txt  |



#### 파일 내용 확인

| **명령어** | **설명**                  | **예제**         |
| ---------- | ------------------------- | ---------------- |
| cat        | 파일 내용 출력            | cat file.txt     |
| less       | 긴 파일을 한 화면씩 보기  | less file.txt    |
| head       | 파일의 처음 몇 줄 출력    | head -5 file.txt |
| tail       | 파일의 마지막 몇 줄 출력  | tail -5 file.txt |
| nano       | 간단한 텍스트 편집기 실행 | nano file.txt    |



#### 파일 검색 및 권한 관리

| **명령어** | **설명**                  | **예제**                    |
| ---------- | ------------------------- | --------------------------- |
| find       | 파일/디렉터리 검색        | find /home -name "file.txt" |
| grep       | 파일에서 특정 문자열 검색 | grep "hello" file.txt       |
| chmod      | 파일 권한 변경            | chmod 755 script.sh         |
| chown      | 파일 소유권 변경          | chown user:group file.txt   |



#### 프로세스 및 시스템 관리

| **명령어** | **설명**                           | **예제**             |
| ---------- | ---------------------------------- | -------------------- |
| ps         | 현재 실행 중인 프로세스 목록       | ps aux               |
| kill       | 특정 프로세스를 종료               | kill 1234 (PID 기반) |
| top        | 실시간 프로세스 모니터링           | top                  |
| htop       | top의 확장판, 인터랙티브한 UI 제공 | htop                 |
| df         | 디스크 사용량 확인                 | df -h                |
| du         | 특정 폴더의 크기 확인              | du -sh folder        |



#### 기타 유용한 명령어

| **명령어** | **설명**                  | **예제**             |
| ---------- | ------------------------- | -------------------- |
| echo       | 문자열 출력               | echo "Hello, World!" |
| whoami     | 현재 로그인한 사용자 출력 | whoami               |
| date       | 현재 날짜 및 시간 표시    | date                 |
| history    | 사용한 명령어 기록 확인   | `history             |
| clear      | 터미널 화면 정리          | clear                |





## Android Studio 확장 팁

### Dart Class Tools

- class 관련 자동 코드 작성

### 폴더 리팩토링 시 import 경로를 같이 바꾸는 방법

- VS code에서 바꾸면 깔끔하게 바뀐다.
  - refactor 활용

### 액션 단축키 입력 시 터미널 man페이지 열리는 것 비활성화

![image-20250320110812101](/Users/okstring/Library/Application Support/typora-user-images/image-20250320110812101.png)

### Android Studio - setting export

setting 들을 내보낼 수 있음



### Live Templates - Dart

- 더하기를 눌러서 Live Template 추가
- 'abb'에 'json2'를 입력하고 코드 붙여넣기
- 'Change'에서 Dart 추가
- 'Edit Variables'를 누르고 사진과 같이 설정

![img](/Users/okstring/Documents/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34379f8a-f123-4311-9a1a-d570acf836e1%2FUntitled.png)

- 'Name'에 정보 입력





### Optimize Imports

- 코드의 import 문을 자동으로 정렬하고 정리해준다

### Action on Save

- 'Action on Save' 설정으로 파일 저장 시 Optimize imports 등 기능들이 자동 실행되도록 할 수 있습니다.

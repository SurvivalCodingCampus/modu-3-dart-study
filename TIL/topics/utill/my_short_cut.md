# Android Studio Short cut 정복



## Android Studio

| 기능 설명                      | 단축키    |
| ------------------------------ | --------- |
| 줄 번호로 바로 이동하는 단축키 | `Cmd + L` |
| Project 창 열기 |Cmd + 1           |
| Project 창에서 코드 파일 열기 |Enter             |
| Project 창 숨기기/보이기 |Cmd + Shift + F12 |
|파일, 디렉토리 영역으로 이동|Cmd + 1|
| 최근에 사용한 프로젝트 오픈  | `Command + E`         |
| Show Context Action         | `Option + Enter`      |
| 중괄호 전체 선택             | `Option + 방향키`     |
| 첫 커서로 이동               | `Fn + Command + Shift + ←` |
| 인덴트 자동 정렬             | `Option + Command + L` |
| 다중 커서 추가               | `Shift + Option + 클릭` |
| 위로 블록 전체 지정, 괄호 전체 블록 | `Option + ↑`          |
| Evaluate Expression 열기(디버깅 관련) | `Option + F8`         |
|앞에 문자 무시하고 개행|Shift + Enter|
|import 도움 단축|Alt + Enter|



## 에뮬레이터 관련

| 기능                             | 단축키 (Windows/Linux)     | 단축키 (Mac)               |
| -------------------------------- | -------------------------- | -------------------------- |
| 에뮬레이터 창 크기 확대          | `Ctrl` + `↑`               | `Cmd` + `↑`                |
| 에뮬레이터 창 크기 축소          | `Ctrl` + `↓`               | `Cmd` + `↓`                |
| 에뮬레이터 창 크기 조절 (드래그) | **마우스로 모서리 드래그** | **마우스로 모서리 드래그** |
| 에뮬레이터 창 원래 크기로 복귀   | `Ctrl` + `0`               | `Cmd` + `0`                |



## git - Android Studio에서 Git 관련 단축키 (Mac)



| **기능**                                   | **단축키**                                   |
| ------------------------------------------ | -------------------------------------------- |
| 변경된 파일 확인 (Version Control 창 열기) | Cmd + 9                                      |
| 변경 사항 커밋                             | Cmd + K                                      |
| Push (Remote 저장소로 업로드)              | Cmd + Shift + K                              |
| Pull (Remote에서 최신 코드 가져오기)       | Cmd + T                                      |
| 파일 히스토리 보기                         | Cmd + Shift + C                              |
| 특정 파일의 Git 변경 내역 확인             | Cmd + Shift + A → “Show History” 검색        |
| 변경 사항 취소 (Revert)                    | Cmd + Alt + Z                                |
| Git 브랜치 변경                            | Cmd + Shift + A → “Branches” 검색            |
| Merge/Rebase 실행                          | Cmd + Shift + A → “Merge” 또는 “Rebase” 검색 |



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




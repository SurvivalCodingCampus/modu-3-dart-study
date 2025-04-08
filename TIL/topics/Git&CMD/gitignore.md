.gitignore 파일에 원하는 파일 숨기는 방법

`

# Ignore Freezed & JsonSerializable generated files

*.freezed.dart
*.g.dart
`
#에 설명 추가하고
** *을 붙이고 숨기고자하는 파일의 확장자를 입력하면 모든 확장자로 끝나는 파일을 무시 **

git add하기전 이 명령어들 입력해주면 확실하게 github에 적용된다

git rm --cached *.freezed.dart
git rm --cached *.g.dart
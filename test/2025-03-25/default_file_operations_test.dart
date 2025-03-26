import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/default_file_operations.dart';
import 'package:test/test.dart';

void main() {
  final String sourceTestPath = 'test/2025-03-25/source.txt';
  final String targetTestPath = 'test/2025-03-25/test_file/target.txt';
  final String testErrPath = 'test/2025-03-25/test_file123/game.txt';


  group('파일 복사 테스트', () {
    test('파일이 존재하지 않으면 예외 발생', () {
      final fileOps = DefaultFileOperations();

      // 존재하지 않는 파일 경로로 테스트
      expect(
        () => fileOps.copy(sourceTestPath, targetTestPath),
        throwsA(isA<PathNotFoundException>()),
      );
    });

    test('대상 디렉토리가 존재하지 않으면 예외 발생', () {
      final fileOps = DefaultFileOperations();

      // 파일이 존재하는 경로를 사용하지만 대상 디렉토리가 없는 경우
      File(sourceTestPath).createSync(); // source.txt 파일 생성
      expect(
        () => fileOps.copy(sourceTestPath, testErrPath),
        throwsA(isA<FileSystemException>()),
      );
      File(sourceTestPath).deleteSync(); // 테스트 후 파일 삭제
    });

    test('파일 복사 성공', () {
      final fileOps = DefaultFileOperations();
      final sourceFile = File(sourceTestPath);
      final targetFile = File(targetTestPath);

      String strTest = """ 
      이 편지는 영국에서 최초로 시작되어 일년에 한바퀴를 돌면서 받는 사람에게 행운을 주었고
      지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 
      이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 
      혹 미신이라 하실지 모르지만 사실입니다.
      영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 
      그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 
      어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 
      나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 
      미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살당했습니다. 
      기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 
      그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들 것입니다. 
      힘들겠지만 좋은 게 좋다고 생각하세요. 7년의 행운을 빌면서...
      """;
      // 임시로 테스트 파일 생성
      sourceFile.writeAsStringSync(strTest);

      // 복사 작업 수행
      fileOps.copy(sourceTestPath, targetTestPath);

      // 복사된 파일이 존재하는지 확인
      expect(targetFile.existsSync(), true);

      // 복사된 파일의 내용도 동일한지 확인
      expect(targetFile.readAsStringSync(), strTest);

      // // 테스트 후 파일 정리
      // sourceFile.deleteSync();
      // targetFile.deleteSync();
    });
  });
}

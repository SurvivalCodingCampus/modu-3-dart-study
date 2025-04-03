// 파일의 확장자 확인 후 해당 확장자로 저장
extension GetFileExtension on String{
  String getFileExtension(){
    if(!contains('.')){
      throw Exception('파일 확장자를 찾을 수 없습니다.');
    }
    return split('.').last;
  }
}
# Dart 09. 파일조작

## **파일 조작의 3단계**

1. **`파일 열기` :** 저장위치(경로)를 설정하고 파일 인스턴스를 생성합니다.
2. **`파일 읽기 또는 쓰기` :** 기존에 작성된 내용을 읽거나 새로운 데이터를 쓰는 작업을 진행합니다.
3. **`파일 닫기` :** 파일 작업이 완료된 후에 종료해야 합니다.

---

## **Dart에서 파일 쓰기 예제 코드**

```dart
import 'dart:io'; // Input/Output 모듈 사용

void main() {
  const filePath =
      '/Users/jilong/Desktop/workspace/flutter_modu/lib/2025-03-25'; 
  // 파일 저장 경로를 지정
  
  final File myFile = File('$$ filePath/my_file.txt'); 
  // File 클래스 사용해 파일 인스턴스 생성
  
  // 1. 내용 덮어쓰기
  myFile.writeAsStringSync('Hello\n');
  
  // 2. 내용 추가쓰기
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);
}
```

---

## **기본 메서드 설명**

### **파일 열기**

- `File` 클래스의 생성자를 통해 파일 인스턴스를 생성합니다.
    
    ```dart
    final File myFile = File('filePath/my_file.txt');
    ```
    

### **파일 쓰기**

1. **덮어쓰기**
    
    기존 파일의 내용을 삭제하고, 새로운 내용을 작성합니다.
    
    ```dart
    myFile.writeAsStringSync('Hello\n');
    ```
    
2. **내용 추가 (Append)**
    
    기존 내용을 유지한 채, 데이터를 추가로 작성합니다.
    
    ```dart
    myFile.writeAsStringSync('Hello\n', mode: FileMode.append);
    ```
    

### **파일 읽기**

1. **동기 방식 파일 읽기**
    
    파일을 읽어 문자열로 반환합니다.
    
    ```dart
    String contents = myFile.readAsStringSync();
    print(contents);
    ```
    

### **파일 닫기**

- Dart에서는 명시적으로 파일을 닫는 메서드가 없습니다.대신, 파일 작업이 종료되면 Dart 런타임에서 자동으로 메모리에서 해제됩니다.

---
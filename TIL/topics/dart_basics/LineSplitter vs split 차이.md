### ✅ `LineSplitter.split(csv)` vs `.split('\n')` 차이점

### 1️⃣ `.split('\n')` 사용

```dart
final rows = csv.split('\n');
```

- CSV 문자열을 `\n` 기준으로 나눈다.
- **문제점**
    - **운영체제(OS)별 개행 문자 차이**
        - Windows: `\r\n` (CRLF)
        - macOS/Linux: `\n` (LF)
        - `csv.split('\n')`만 사용하면 Windows 환경에서 `\r`(캐리지 리턴)이 남아 있을 수 있음.

### 2️⃣ `LineSplitter.split(csv)` 사용

```dart
final rows = LineSplitter.split(csv).toList();
```

- OS에 맞게 **자동으로 개행 문자(`\n`, `\r\n`)를 처리**한다.
- **크로스 플랫폼(Windows, macOS, Linux)에서 안정적인 동작을 보장.**

---

### ✨ `.split('\n')`로 대체하는 방법 (개선 버전)

```dart
dart
final rows = csv.split(RegExp(r'\r?\n')).where((row) => row.isNotEmpty).toList();
```

- `RegExp(r'\r?\n')`: **Windows(`\r\n`)와 Unix/Linux(`\n`) 개행을 모두 처리**.
- `.where((row) => row.isNotEmpty)`: 빈 줄 제거.

---

### 🔥 최종 코드 (LineSplitter 없이)

```dart
dart
List<List<String>> _parseCsv(String csv) {
  final rows = csv.split(RegExp(r'\r?\n')).where((row) => row.isNotEmpty).toList();
  return rows.map((row) => row.split(',')).toList();
}

```

이제 **운영체제에 상관없이 CSV를 안전하게 처리할 수 있음.**
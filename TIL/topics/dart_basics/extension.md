## Extension
- Dart는 공식적으로 래퍼 클래스를 지원하지 않음
- `extension`과 `on` 키워드를 통해 특정 타입을 확장할 수 있음

```dart
extension MyIntExtension on int {
	bool get isEven => this % 2 == 0;
	int get square => this * this;

	bool get isPrime {
		if (this <= 1) return false;
		if (this == 2) return true;
		if (this % 2 == 0) return false;
		for (int i = 3; i * i <= this; i += 2) {
			if (this % i == 0) {
				return false;
			}
		}

		return true;
	}

	int multiple(int x) {
		return this * x;
	}
}

void main() {
	int number = 4;
	int prime = 1009;

	print(number.isEven); // true
	print(number.square); // 16
	print(number.isPrime); // false
	print(prime.isPrime); // true
	print(number.multiple(2)); // 8
}
```

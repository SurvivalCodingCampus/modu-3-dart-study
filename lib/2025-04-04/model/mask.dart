import 'package:freezed_annotation/freezed_annotation.dart';

part 'mask.freezed.dart';
part 'mask.g.dart';

@freezed
abstract class Mask with _$Mask {
  const factory Mask({
    required String name,               // 약국 이름
    required String address,            // 주소
    required double latitude,              // 위도
    required double longitude,             // 경도
    required String remainStatus,       // 재고 상태
    required DateTime stockAt,          // 마지막 입고 시각
    required DateTime createdAt,        // 데이터 생성 시각
  }) = _Mask;

  factory Mask.fromJson(Map<String, dynamic> json) => _$MaskFromJson(json);
}

extension MaskPrinter on Mask {
  String prettyPrint() {
    return '''
🏪 약국 이름     : $name
📍 주소         : $address
📦 재고 상태     : ${_formatRemainStat(remainStatus)}
🕒 입고 시간     : $stockAt
🕒 데이터 생성  : $createdAt
🌐 위치         : 위도 $latitude / 경도 $longitude
${'-' * 50}
''';
  }

  String _formatRemainStat(String stat) {
    switch (stat) {
      case 'plenty':
        return '100개 이상 ✅';
      case 'some':
        return '30개 ~ 100개 🟡';
      case 'few':
        return '2개 ~ 30개 🔴';
      case 'empty':
        return '1개 이하 ❌';
      default:
        return '정보 없음 ❓';
    }
  }
}
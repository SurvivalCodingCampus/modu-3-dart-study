import 'package:intl/intl.dart';

extension DateTimeExtension on String? {
  DateTime? toDateTime({required String format}) {
    final str = this ?? '';
    try {
      return DateFormat(format).parse(str);
    } catch (e) {
      print('날짜 파싱 오류');
      return null;
    }
  }
}

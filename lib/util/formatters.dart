import 'package:intl/intl.dart';

String fullDateToJa(DateTime date) {
  return '${date.year}年${date.month}月${date.day}日${DateFormat('EEEE', 'ja').format(date)}';
}

/*
2020-08-20 16:00:00.000 みたいなDateTimeから16:00みたいに時間を抜き出してフォーマットする
 */
String extractTime(DateTime date) {
  return '${date.hour}:${date.minute.toString().padLeft(2, "0")}';
}

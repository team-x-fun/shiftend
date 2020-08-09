import 'package:intl/intl.dart';

String fullDateToJa(DateTime date) {
  return '${date.year}年${date.month}月${date.day}日${DateFormat('EEEE', 'ja').format(date)}';
}

String fullDateToTime(DateTime date) {
  return '${date.hour}:${date.minute.toString().padLeft(2, "0")}';
}

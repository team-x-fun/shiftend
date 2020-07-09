import 'package:intl/intl.dart';

String fullDateToJa(DateTime date) {
  return '${date.year}年${date.month}月${date.day}日${DateFormat('EEEE', 'ja').format(date)}';
}

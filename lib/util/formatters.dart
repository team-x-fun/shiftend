import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
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

String toRegularHoliday(int dayOfWeekNum, int nWeekNum) {
  final jpDateSymbols = dateTimeSymbolMap()['ja'] as DateSymbols;
  final weekDay = jpDateSymbols.STANDALONEWEEKDAYS[dayOfWeekNum];
  String prefix = '';
  if (nWeekNum == 0) {
    prefix = '毎週';
  } else {
    prefix = '第$nWeekNum';
  }

  return '$prefix$weekDay';
}
